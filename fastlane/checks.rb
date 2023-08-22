require 'redcarpet'

def check_links_in_folder(folder)
    all_errors = []
    markdown_files(folder).each do |markdown_file|
        errors = check_links_in_file(markdown_file)
        errors.each do |error|
            all_errors << error unless all_errors.include?(error)  # Add error if not already present
        end
    end
    return all_errors
end

def check_links_in_file(markdown_file)
    markdown_content = get_file_contents(markdown_file)

    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)

    links = []

    markdown.render(markdown_content).scan(/<a href="([^"]+)"/) do |url|
        links << url[0]
    end

    errors = []
    links.each do |url|
        next unless url.start_with?('http')

        begin
            response = URI.open(url)
            Fastlane::UI.message("OK - #{url}") if response.status[0] == '200'
        rescue OpenURI::HTTPError => e
            if e.io.status[0] == '404'
                Fastlane::UI.error("Broken link in #{markdown_file}: #{url} - #{e.message}")
                errors << url
            else
                Fastlane::UI.error("Error checking link: #{url} - #{e.message}")
            end
        rescue StandardError => e
            Fastlane::UI.error("Error checking link: #{url} - #{e.message}")
        end
    end
    errors
end
