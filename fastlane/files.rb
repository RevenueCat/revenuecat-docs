def markdown_files(folder)
    Dir.chdir(root_dir) do
        Dir.glob("#{folder}/**/*.md")
    end
end

def yaml_data(filename)
    Dir.chdir(root_dir) do
        file = File.read(filename)
        yaml_header, _ = file.split('---', 3)[1..-1]
        YAML.load(yaml_header)
    end
end

def get_file_contents(file)
    Dir.chdir(root_dir) do
        File.read(file)
    end
end

def root_dir
    File.dirname(Dir.pwd)
end

def write_file_contents(file, file_contents)
    Dir.chdir(root_dir) do
        File.write(file, file_contents)
    end
end

def create_folder(output_dir)
    Dir.chdir(root_dir) do
        FileUtils.mkdir_p(output_dir)
    end
end

def clone_folder(original, destination)
    Dir.chdir(root_dir) do
        FileUtils.rm_rf destination
        FileUtils.copy_entry original, destination
    end
end

def delete_folder(folder)
    Dir.chdir(root_dir) do
        FileUtils.rm_rf folder
    end
end

def recreate_folder(folder)
    Dir.chdir(root_dir) do
        FileUtils.rm_rf folder
        FileUtils.mkdir_p folder
    end
end

def copy_to(files, folder)
    files.each do |file|
        Dir.chdir(root_dir) do
            if File.exist?(file)
                FileUtils.cp(file, folder)
            end
        end
    end
end

def file_exists(file)
    Dir.chdir(root_dir) do
        File.exist?(file)
    end
end

def get_forefront(file_name)
    file_contents = get_file_contents(file_name)
    forefront, _ = file_contents.split('---', 3)[1..-1]
    forefront
end

def get_doc_content(file_name)
    file_contents = get_file_contents(file_name)
    _, content = file_contents.split('---', 3)[1..-1]
    content
end

def replace_in_file(file_name, old, new)
    file_contents = get_file_contents(file_name)
    file_contents.gsub!(old, new)
    write_file_contents(file_name, file_contents)
end