has_rendered_docs_changes = !git.modified_files.grep(/rendered_docs/).empty?

if has_rendered_docs_changes && github.pr_author != "RCGitBot"
    fail "Don't modify files in the rendered_docs folder. Changes should me made inside the docs_source folder"
end