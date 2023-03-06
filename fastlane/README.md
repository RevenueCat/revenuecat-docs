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

### render_docs

```sh
[bundle exec] fastlane render_docs
```

Description of what the lane does

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

folder, STRING Folder to recurse through and extract code blocks from all markdown files

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
