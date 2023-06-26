import 'files.rb'

CATEGORIES_FILE = "docs_source/categories.json"

def find_category_slug_from_id(category_id)
    file = File.read(CATEGORIES_FILE)
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