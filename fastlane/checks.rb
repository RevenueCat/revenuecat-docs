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
    links = markdown_content.scan(/\[([^\]]+)\]\(([^)]+)\)/)

    errors = []
    links.each do |text, url|
        next unless url.start_with?('http')

        Fastlane::UI.message("Checking link: #{url}")
        Fastlane::UI.message("Text: #{text}")

        begin
            response = URI.open(url)
            Fastlane::UI.message("OK - #{url}") if response.status[0] == '200'
        rescue OpenURI::HTTPError => e
            Fastlane::UI.error("Broken link in #{markdown_file}: #{url} - #{e.message} - #{e}")
            errors << url
        rescue StandardError => e
            Fastlane::UI.message("Error checking link: #{url} - #{e.message}")
        end
    end
    errors
end
