def get_file_contents(file)
    Dir.chdir(root_dir) do
        File.read(file)
    end
end