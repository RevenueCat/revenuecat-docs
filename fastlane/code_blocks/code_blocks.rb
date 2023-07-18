require_relative '../files.rb'
require_relative '../git.rb'

UI = Fastlane::UI

def extract_code_blocks(source_folder, code_blocks_folder, from_files = [])
    UI.message("🔨 Extracting code blocks from #{from_files}...")
    from_files.each do |file_name|
        UI.message("🔨 Processing #{file_name}...")
        current_folder = File.dirname(file_name)
        UI.message("🔨 Current folder #{current_folder}...")
        folder_inside_docs_source = current_folder.sub(/^#{source_folder}\//, "")
        output_dir = "#{code_blocks_folder}/#{folder_inside_docs_source}"

        file_contents = get_file_contents(file_name)

        create_folder(output_dir)

        file_contents = convert_old_style_code_blocks(file_contents)

        modified_file_content = replace_code_block_group(file_contents, file_name, output_dir)
        write_file_contents(file_name, modified_file_content)
    end
end

def clean_images_in_file_contents(file_contents)
    file_contents.scan(/\[block:image\](.*?)\[\/block\]/m).each_with_index do |block, index|
        content = block[0]
        unless content
            next
        end
        image_data = JSON.parse(content)
        image_url = image_data['images'][0]['image'][0]
        title = image_data['images'][0]['image'][1]

        alt_text = image_data['images'][0]['image'][2] || ''
        caption = image_data['images'][0]['caption']
        align = image_data['images'][0]['align']
        sizing = image_data['images'][0]['sizing']
        # We are not supporting caption, align and sizing for now. Needs more testing
        # html = "<img alt=\"#{alt_text}\" src=\"#{image_url}\" title=\"#{title}\" align=\"#{align}\" width=\"#{sizing}\" caption=\"#{caption}\">"
        # file_contents.gsub!("[block:image]#{content}[/block]", html)
        unless sizing || caption || align
            file_contents.gsub!("[block:image]#{content}[/block]", "![](#{image_url} \"#{title}\")")
        end
    end
    file_contents
end

def clean_images(source_folder)
    markdown_files(source_folder).each do |filename|
        file_contents = get_file_contents(filename)

        UI.message("🔨 Processing #{filename}...")

        cleaned_contents = clean_images_in_file_contents(file_contents)

        write_file_contents(filename, cleaned_contents)
    end
end

##
# Extracts all code within backticks to a file and adds the file information in a [block:file] block.
# This function also works with code blocks that are all together forming a code block group.
#
# For example this block in a markdown file named docs_source/➡️ Migrating To RevenueCat/purchase-completed.md:
#
# ```swift
# let purchaseCompleted = "com.myapp.product1"
# ```
# ```kotlin
# val purchaseCompleted = "com.myapp.product1"
# ```
#
# Will be converted to:
# [block:file]
# [{
#      "language":"swift",
#      "name":"Swift",
#      "file":"code_blocks/➡️ Migrating To RevenueCat/purchase-completed.swift"
#  },
#  {
#      "language":"kotlin",
#      "name":"Kotlin",
#      "file":"code_blocks/➡️ Migrating To RevenueCat/purchase-completed_2.kt"
#  }]
# [/block]
#
# @param file_contents [String] the input string containing the whole content of the file
# @param file_name [String] the name of the file being processed
# @param output_dir [String] the directory where the extracted code blocks will be saved
# @return [String] a string equal to the file_contents but with the code blocks replaced by a [block:file] block
def replace_code_block_group(file_contents, file_name, output_dir)
    current_code_block = []
    code_block_group = []
    code_block_group_replacement = []
    counter = 0

    lines = file_contents.each_line.to_a
    modified_file_content = file_contents.dup
    lines.each_with_index do |line, line_index|
        beginning_or_end_of_block = line.start_with?('```')
        inside_block = !current_code_block.empty?

        # Check if the line is the beginning or end of a code block
        if beginning_or_end_of_block
            is_beginning_of_block = current_code_block.empty? && line[3..].strip != ''
            is_end_of_block = !current_code_block.empty?

            if is_beginning_of_block
                # Process the beginning of a code block
                current_code_block << line
                code_block_group << line

            elsif is_end_of_block
                # Process the end of a code block
                current_code_block << line
                code_block_group << line
                filename_without_ext = File.basename(file_name, ".md")
                UI.message("🔨 Processing code block #{counter} in #{file_name}...")

                # Extract the code block to a file and obtain the block information
                code_block_information = extract_block_to_file(output_dir, filename_without_ext, current_code_block.join, counter)
                if code_block_information.length > 0
                    code_block_group_replacement << code_block_information.to_json
                    current_code_block = []
                    counter += 1
                end
                next_line = lines[line_index + 1]
                next_line_is_beginning_of_block = next_line && next_line.start_with?('```') && next_line[3..].strip != ''

                # Reached the end of a code block group, replace the code block group with the extracted files information
                unless next_line_is_beginning_of_block
                    modified_file_content = replace_code_group(code_block_group, code_block_group_replacement, modified_file_content)
                    code_block_group = []
                    code_block_group_replacement = []
                end
            end
        elsif inside_block
            # Process lines inside a code block
            current_code_block << line
            code_block_group << line
        end
    end
    modified_file_content
end

def replace_code_group(original, replacement, file_contents)
    json = JSON.parse("[#{replacement.join(",\n")}]")
    pretty_json = JSON.pretty_generate(json)
    replacement = "[block:file]\n#{pretty_json}\n[/block]\n"
    file_contents.gsub(original.join, replacement)
end

def embed_code_blocks(render_folder, source_folder)
    clone_folder(source_folder, render_folder)

    markdown_files(render_folder).each do |file_name|
        file_contents = get_file_contents(file_name)

        file_contents.scan(/\[block:file\].*?\[\/block\]/m).each_with_index.map do |block, index|
            UI.message("🔨 Processing file block #{index} in #{file_name}...")
            code_to_embed = embed_code_from_files(block)
            file_contents.gsub!("#{block}", "#{code_to_embed.chomp}")
        end

        write_file_contents(file_name, file_contents)
    end
end

def preview_rendered_docs(render_folder, temp_folder, source_folder)
    backup_folder = "#{render_folder}_backup"
    clone_folder(render_folder, backup_folder)

    embed_code_blocks(render_folder, source_folder)

    restore_forefronts(backup_folder, render_folder)
    delete_folder(backup_folder)

    copy_modified_markdown_files(render_folder, temp_folder)
end

def restore_forefronts(backup_folder, render_folder)
    markdown_files(render_folder).each do |file_name|
        path_inside_render_folder = file_name.gsub("#{render_folder}/", '')
        backup_file_path = "#{backup_folder}/#{path_inside_render_folder}"
        if file_exists(backup_file_path)
            forefront = get_forefront(file_name)
            forefront_backup = get_forefront(backup_file_path)
            replace_in_file(file_name, forefront, forefront_backup)
        end
    end
end

def copy_modified_markdown_files(render_folder, temp_folder)
    modified_files = git_modified_markdown_files(render_folder)
    UI.message("🔨 Copying #{modified_files} to temp folder...")

    recreate_folder(temp_folder)

    copy_to(modified_files, temp_folder)
end

##
# Embeds all files within the [block:file] and [/block] tags and adds the content of the file as a code block
#
# For example this block in a markdown file named docs_source/v4.0.1/-- Resources/server-notifications/example.md:
#
# [block:file]
# javascript->code_blocks/docs_source/v4.0.1/-- Resources/server-notifications/example_1.js
# [/block]
#
# Will be converted to:
# [block:code]
# {
#   "codes": [
#     {
#       "code": "var a = 1;",
#       "language": "javascript"
#     }
#   ]
# }
# [/block]
#
# @param code_blocks_group_with_tags [String] the input string containing the code block. This is the entire string that
# contains the file block including the [block:file] and [/block] tags.
# @return [String] a string containing the code blocks from all the files within the file block
def embed_code_from_files(code_blocks_group_with_tags)
    embedded_code_blocks_group = []

    code_blocks_group_json_array = code_blocks_group_with_tags.gsub(/\[block:file\]|\[\/block\]/, '')
    code_block_information_array = JSON.parse(code_blocks_group_json_array)
    UI.message("🔨 Processing #{code_block_information_array}...")
    code_block_information_array.each do |code_block_information|
        language = code_block_information['language']
        file_path = code_block_information['file']
        name = code_block_information['name']
        region = code_block_information['region']
        next unless file_exists(file_path)

        file_content = extract_region_from_file(file_path, region, language)
        embedded_code_blocks_group.push "```#{language} #{name}\n#{file_content}\n```"
    end

    embedded_code_blocks_group.join("\n").strip
end

# Get the region from the file
# For example calling this method:
# Purchases.logLevel = .debug
# // MARK: Observer mode configuration
# Purchases.configure(
#   with: Configuration.Builder(withAPIKey: Constants.apiKey)
#     .with(appUserID: <app_user_id>)
#     .with(observerMode: true)
#     .build()
# )
# // END
# will return
# Purchases.configure(
#   with: Configuration.Builder(withAPIKey: Constants.apiKey)
#     .with(appUserID: <app_user_id>)
#     .with(observerMode: true)
#     .build()
# )
def extract_region_from_file(file_path, region, language)
    file_content = get_file_contents(file_path).strip

    case language
    when 'swift'
        marked_region = file_content.scan(/\/\/\s*MARK:\s*#{region}\n(.*?)\/\/\s*END/m).flatten.first
        unless marked_region == nil
            return marked_region.strip
        end
    when 'kotlin'
        marked_region = file_content.scan(/\/\/\s*region\s*#{region}\n(.*?)\/\/\s*endregion/m).flatten.first
        unless marked_region == nil
            return marked_region.strip
        end
    end
    return file_content
end


# Searches for is [block:code][/block] and replaces it with the Readme flavored markdown style code blocks.
# For example:

# [block:code]
# {
#  "codes": [
#  {
#    "code": "This is a code block",
#    "language": "text",
#    "name": "Code block"
#  },
#  {
#    "code": "This is another code block",
#    "language": "text",
#    "name": "Another code block"
#  }]
# }
# [/block]
#
# becomes
#
# ```text Code block
# This is a code block
# ```
# ```text Another code block
# This is another code block
# ```
def convert_old_style_code_blocks(input)
    block_code_regex = /\[block:code\]\s*(\{[\s\S]*?\})\s*\[\/block\]/

    input.gsub(block_code_regex) do |code_block_tag|
        block = extract_code_block(code_block_tag)
        json = block[block.index("{")..block.rindex("}")]
        data = JSON.parse(json)
        codes = data["codes"]
        new_style_code_blocks = ""

        UI.message("🔨 Will migrate #{codes.count} code blocks within a [block:code] tag to backticks...")

        codes.each do |code_item|
            new_style_code_blocks += process_code_block(code_item)
        end

        new_style_code_blocks.chomp
    end
end

def extract_code_block(code_block)
    block_start = code_block.index("[block:")
    block_end = code_block.index("[/block]", block_start)
    code_block[block_start..block_end].strip
end

def process_code_block(code_item)
    code = code_item["code"].strip
    language = code_item["language"].strip
    name = code_item.key?("name") ? code_item["name"].strip : nil

    if name
        new_style_code_block = "```#{language} #{name}\n#{code}\n```\n"
    else
        new_style_code_block = "```#{language}\n#{code}\n```\n"
    end

    new_style_code_block
end

##
# Extracts all code blocks from within the [block:code] and [/block] tags and saves each code block to a file, with the
# correct extension.
#
# For example this code block in a markdown file named docs_source/v4.0.1/-- Resources/server-notifications/example.md:
#
# [block:code]
# {
#   "codes": [
#     {
#       "code": "var a = 1;",
#       "language": "javascript"
#     }
#   ]
# }
# [/block]
#
# Will be converted to:
# [block:file]
# javascript->code_blocks/docs_source/v4.0.1/-- Resources/server-notifications/example_1.js
# [/block]
#
# And the code block will be saved to code_blocks/docs_source/v4.0.1/-- Resources/server-notifications/example_1.js
# @param output_dir [String] the output directory to save the file
# @param file_name_no_ext [String] the name of the file where this code block lives, without extension
# @param code_block [String] the input string containing the code block. This is the entire string that contains the
# code block including the [block:code] and [/block] tags
# @param index [Integer] the index of the code block within the file. This is used to create a unique file name for each
# code block
# @return [Hash] a hash of language to file paths for the extracted code blocks
def extract_block_to_file(output_dir, file_name_no_ext, code_block, index)
    code_information = extract_markdown_code_block_information(code_block)
    if code_information
        language = code_information["language"]
        code = code_information["code"].strip
        extension = determine_extension(language)
        new_file = "#{output_dir}/#{file_name_no_ext}_#{index + 1}.#{extension}"
        Dir.chdir(root_dir) do
            File.write(new_file, code)
        end
        UI.message("⚙️  Creating #{new_file}...")

        {
            "language" => language,
            "name" => code_information["name"],
            "file" => new_file,
        }
    else
        {}
    end
end

def extract_markdown_code_block_information(code_block)
    lines = code_block.split("\n")
    if lines.length > 1 # code blocks in callouts are one liners. Don't process them
        header = lines[0].sub("```", "").split(" ")
        language = header[0]
        name = header.length > 1 ? header[1..-1].join(" ") : "" # Name is everything after the language and it's optional
        code = lines[1..-2].join("\n") # Code is everything between the first and last line
        {
            "language" => language,
            "name" => name,
            "code" => code,
        }
    else
        nil
    end
end

##
# A map of languages to their corresponding file extensions
LANGUAGE_EXTENSIONS = {
    "objectivec" => "m",
    "kotlin" => "kt",
    "javascript" => "js",
    "typescript" => "ts",
    "csharp" => "cs",
    "text" => "txt"
}

##
# Determines the file extension for a given language
# @param lang [String] the language
# @return [String] the file extension
def determine_extension(lang)
    LANGUAGE_EXTENSIONS[lang.downcase] || lang
end
