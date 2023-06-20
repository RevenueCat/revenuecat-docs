def markdown_files(folder = SOURCE_FOLDER)
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
