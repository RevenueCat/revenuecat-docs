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