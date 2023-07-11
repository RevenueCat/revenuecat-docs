def git_modified_markdown_files(folder)
    modified_files = sh("git diff --name-only -z").split("\0")
    modified_files = modified_files.map { |file| file.gsub("\\", '') }

    modified_files.select { |file| File.fnmatch("#{folder}/**/*.md", file) }
end