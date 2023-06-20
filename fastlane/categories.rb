import 'files.rb'

CATEGORIES_FILE = "docs_source/categories.json"
CATEGORIES_TEST_FILE = "docs_source/categories_test_project.json"
CATEGORIES_MAP_FILE = "docs_source/categories_map.json"

def find_category_slug_from_id(category_id)
    # TODO replace with production file
    file = File.read(CATEGORIES_TEST_FILE)
    categories = JSON.parse(file)
    matching_category = categories.find { |category| category['id'] == category_id }
    matching_category ? matching_category['slug'] : nil
end

def check_docs_for_category(folder)
    markdown_files(folder).each do |file|
        yaml_data = yaml_data(file)

        category_slug = yaml_data['categorySlug']
        UI.message("Checking #{file} with category slug #{category_slug}")
        if category_slug.nil?
            UI.user_error!("Category slug not found in #{file}")
        end
    end
end