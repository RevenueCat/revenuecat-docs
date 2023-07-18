fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### sync_files_to_readme

```sh
[bundle exec] fastlane sync_files_to_readme
```



### extract_code_blocks

```sh
[bundle exec] fastlane extract_code_blocks
```

Extracts code blocks from within the [block:code] and [/block] tags and saves each code block to a file
folder, STRING Folder to recurse through and extract code blocks from all markdown files. Path is relative to the root of the project.


### open_syncing_pr

```sh
[bundle exec] fastlane open_syncing_pr
```

Embeds code blocks from all files and opens a pull request preparing the docs for syncing to Readme


### embed_code_blocks

```sh
[bundle exec] fastlane embed_code_blocks
```

Embeds code blocks from all files within the [block:file] and [/block] tags

### preview_rendered_docs

```sh
[bundle exec] fastlane preview_rendered_docs
```

Embeds code blocks from all files within the [block:file] and [/block] tags

### post_circleci_artifacts

```sh
[bundle exec] fastlane post_circleci_artifacts
```

Embeds code blocks from all files within the [block:file] and [/block] tags

### update_docs_structure

```sh
[bundle exec] fastlane update_docs_structure
```

Updates rendered docs folder to the current category, order and parent information from Readme
readme_api_key, STRING Readme API key for the project


### clean_docs_source_headers

```sh
[bundle exec] fastlane clean_docs_source_headers
```

Removes all categories from docs_source


### clean_images

```sh
[bundle exec] fastlane clean_images
```

Clean old format images


### update_categories_file

```sh
[bundle exec] fastlane update_categories_file
```

Updates the JSON files containing the categories for a Readme.com project.
readme_api_key, STRING Readme API key for the project
readme_api_key_test STRING Readme API key for the test project


### check_docs_categories

```sh
[bundle exec] fastlane check_docs_categories
```



### migration

```sh
[bundle exec] fastlane migration
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
