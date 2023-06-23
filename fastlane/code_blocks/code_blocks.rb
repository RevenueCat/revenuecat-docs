require_relative '../files.rb'

UI = Fastlane::UI

def replace_code_group(original, replacement, file_contents)
    json = JSON.parse("[#{replacement.join(",\n")}]")
    pretty_json = JSON.pretty_generate(json)
    replacement = "[block:file]\n#{pretty_json}\n[/block]\n"
    file_contents.gsub(original, replacement)
end

def extract_code_blocks(source_folder, code_blocks_folder, from_files = [])
    UI.message("🔨 Extracting code blocks from #{from_files}...")
    from_files.each do |file_name|
        UI.message("🔨 Processing #{file_name}...")
        current_folder = File.dirname(file_name)
        UI.message("🔨 Current folder #{current_folder}...")
        folder_inside_docs_source = current_folder.sub(/^#{source_folder}\//, "")
        output_dir = "#{code_blocks_folder}/#{folder_inside_docs_source}"

        file_contents = get_file_contents(file_name)

        Dir.chdir(root_dir) do
            FileUtils.mkdir_p(output_dir)
        end

        file_contents = convert_old_style_code_blocks(file_contents)

        current_code_block = ""
        code_block_group = ""
        code_block_group_replacement = []
        counter = 0

        lines = file_contents.each_line.to_a
        modified_file_content = file_contents.dup
        lines.each_with_index do |line, line_index|
            beginning_or_end_of_block = line.start_with?('```')
            inside_block = current_code_block != ""
            if beginning_or_end_of_block
                is_beginning_of_block = current_code_block == "" && line[3..].strip != ''
                is_end_of_block = current_code_block != ""
                if is_beginning_of_block
                    current_code_block += line
                    code_block_group += line
                elsif is_end_of_block
                    current_code_block += line
                    code_block_group += line
                    filename_without_ext = File.basename(file_name, ".md")
                    UI.message("🔨 Processing code block #{counter} in #{file_name}...")
                    code_block_information = extract_block_to_file(output_dir, filename_without_ext, current_code_block, counter)
                    if code_block_information.length > 0
                        code_block_group_replacement << code_block_information.to_json
                        current_code_block = ""
                        counter += 1
                    end
                    next_line = lines[line_index + 1]
                    more_code_blocks_in_group = next_line && next_line.start_with?('```')
                    unless more_code_blocks_in_group
                        modified_file_content = replace_code_group(code_block_group, code_block_group_replacement, modified_file_content)
                        code_block_group = ""
                        code_block_group_replacement = []
                    end
                end
            elsif inside_block
                current_code_block += line
                code_block_group += line
            end
        end
        write_file_contents(file_name, modified_file_content)
    end
end

def embed_code_blocks(render_folder, source_folder)
    copy_docs_source_to_render_folder(source_folder, render_folder)

    Dir.chdir(root_dir) do
        Dir.glob("#{render_folder}/**/*.md").each do |file_name|
            file_contents = File.read(file_name)

            file_contents.scan(/\[block:file\].*?\[\/block\]/m).each_with_index.map do |block, index|
                UI.message("🔨 Processing file block #{index} in #{file_name}...")
                code_to_embed = embed_code_from_files(block)
                file_contents.gsub!("#{block}", "#{code_to_embed.chomp}")
            end

            File.write(file_name, file_contents)
        end
    end
end

def copy_docs_source_to_render_folder(source_folder, render_folder)
    Dir.chdir(root_dir) do
        FileUtils.rm_rf render_folder
        FileUtils.copy_entry source_folder, render_folder
    end
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
# @param block [String] the input string containing the code block. This is the entire string that contains the
# file block including the [block:file] and [/block] tags.
# @return [String] a string containing the code blocks from all the files within the file block
def embed_code_from_files(block)
    new_content = []

    block = block.gsub(/\[block:file\]|\[\/block\]/, '')
    json_array = JSON.parse(block)
    UI.message("🔨 Processing #{json_array}...")
    json_array.each do |json|
        language = json['language']
        file_path = json['file']
        name = json['name']
        next unless File.exist?(file_path)

        file_content = File.read(file_path)
        new_content.push "```#{language} #{name}\n#{file_content}\n```"
    end

    new_content.join("\n").strip
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
