fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### bootstrap

```sh
[bundle exec] fastlane bootstrap
```

Install dependencies

### ios_tests

```sh
[bundle exec] fastlane ios_tests
```



### copy_docs_source_to_render_folder

```sh
[bundle exec] fastlane copy_docs_source_to_render_folder
```



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

### update_docs_structure

```sh
[bundle exec] fastlane update_docs_structure
```

Updates rendered docs folder to the current category, order and parent information from Readme
readme_api_key, STRING Readme API key for the project


### remove_categories_from_docs_source

```sh
[bundle exec] fastlane remove_categories_from_docs_source
```

Removes all categories from docs_source


### update_categories_file

```sh
[bundle exec] fastlane update_categories_file
```

Updates the JSON files containing the categories for a Readme.com project.
readme_api_key, STRING Readme API key for the project
readme_api_key_test STRING Readme API key for the test project


### sync_categories_between_projects

```sh
[bundle exec] fastlane sync_categories_between_projects
```

Updates the JSON files containing the categories for a Readme.com project, including categories.json,
categories_test_project.json and categories_map.json and creates matching categories in the readme test project.
readme_api_key, STRING Readme API key for the project
readme_api_key_test STRING Readme API key for the test project


### update_docs_categories

```sh
[bundle exec] fastlane update_docs_categories
```

Updates categories for all the docs in a folder. It tries to guess the category using the folder that contains the
document and uses Readme's API as a backup
readme_api_key, STRING Readme API key for the project
force_update_categories BOOLEAN True will force the categories.json to be updated, false will use the existing categories.json


### sync_order_with_test_project

```sh
[bundle exec] fastlane sync_order_with_test_project
```

Updates categories for all the docs in a folder. It tries to guess the category using the folder that contains the
document and uses Readme's API as a backup
readme_api_key, STRING Readme API key for the project
force_update_categories BOOLEAN True will force the categories.json to be updated, false will use the existing categories.json


----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
