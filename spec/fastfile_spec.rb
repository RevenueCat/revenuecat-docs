require_relative '../fastlane/readme_api/api'
require_relative '../fastlane/code_blocks/code_blocks'
require 'rspec'

Actions = Fastlane::Actions

RSpec.describe 'Fastfile' do
    before do
        @ff = Fastlane::FastFile.new('./fastlane/Fastfile')
        # Set the current working directory to the spec folder so it behaves the same as fastlane
        current_dir = File.dirname(File.expand_path(__FILE__))
        Dir.chdir(current_dir)
    end

    context 'code_blocks' do
        it 'extract_code_blocks' do
            extract_code_blocks('docs_source', 'code_blocks', ['docs_source/📘 SDK Guides/migration-guides/android-native-4x-to-5x-migration.md'])
        end
        it 'embed_code_blocks' do
            embed_code_blocks('rendered_docs', 'docs_source')
        end
        it 'preview_docs' do
            preview_rendered_docs('temp', 'docs_source')
        end
    end
end