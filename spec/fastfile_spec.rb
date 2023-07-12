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
        it 'embed_code_blocks' do
            embed_code_blocks('spec/test_files/rendered_docs', 'spec/test_files/docs_source')
            Dir.chdir(root_dir) do
                rendered_docs = Dir.glob("spec/test_files/rendered_docs/**/*.md")
                expected_docs = Dir.glob('spec/test_files/expected_rendered_docs/**/*.md')
                expect(rendered_docs.size).to be > 0
                expect(rendered_docs.size).to eq(expected_docs.size)
                rendered_docs.each_with_index do |rendered_doc, index|
                    expected_doc = expected_docs[index]
                    rendered_doc_content = File.read(rendered_doc)
                    expected_doc_content = File.read(expected_doc)
                    expect(expected_doc_content.size).to be > 0
                    expect(expected_doc_content).to eq(rendered_doc_content)
                end
            end
        end
    end
end