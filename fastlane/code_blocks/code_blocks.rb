require_relative '../utils.rb'
require_relative '../files.rb'

def extract_code_blocks(source_folder)
    markdown_files.each do |file_name|
        UI.message("🔨 Processing #{file_name}...")
        current_folder = File.dirname(file_name)
        UI.message("🔨 Current folder #{current_folder}...")
        folder_inside_docs_source = current_folder.sub(/^#{source_folder}\//, "")
        output_dir = "code_blocks/#{folder_inside_docs_source}"

        file_contents = get_file_contents(file_name)

        Dir.chdir(root_dir) do
            FileUtils.mkdir_p(output_dir)
        end

        file_contents = convert_old_style_code_blocks(file_contents)

        code_blocks = file_contents.scan(/```\w+[\s\S]+?```/)
        total_blocks = code_blocks.length

        code_blocks.each_with_index.map do |block, index|
            filename_without_ext = File.basename(file_name, ".md")
            UI.message("🔨 Processing code block #{index + 1}/#{total_blocks} in #{file_name}...")
            code_block_information = extract_block_to_file(output_dir, filename_without_ext, block, index)
            if code_block_information.length > 0
                file_contents.gsub!("#{block}", "[block:file]\n#{code_block_information.to_json}\n[/block]")
            end
        end

        write_file_contents(file_name, file_contents)
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
# @param file_block [String] the input string containing the code block. This is the entire string that contains the
# file block including the [block:file] and [/block] tags
# @return [String] a string containing the code blocks from all the files within the file block
def embed_code_from_files(file_block)
    block = extract_code_block(file_block)
    new_content = []

    block.each_line do |line|
        next if line.start_with?("[")
        file_tag_content = line.strip
        json = JSON.parse(file_tag_content)
        UI.message("Extracted json: #{block}")

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

        new_style_code_blocks
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
