def check_links_in_folder(folder)
    markdown_files(folder).each do |markdown_file|
        check_links_in_file(markdown_file)
    end
end

def check_links_in_file(markdown_file)
    markdown_content = get_file_contents(markdown_file)
    links = markdown_content.scan(/\[([^\]]+)\]\(([^)]+)\)/)

    links.each do |text, url|
        next unless url.start_with?('http')

        Fastlane::UI.message("Checking link: #{url}")
        Fastlane::UI.message("Text: #{text}")

        begin
            response = URI.open(url)
            Fastlane::UI.message("OK - #{url}") if response.status[0] == '200'
        rescue OpenURI::HTTPError => e
            Fastlane::UI.error("Broken link in #{markdown_file}: #{url} - #{e.message}")
        rescue StandardError => e
            Fastlane::UI.message("Error checking link: #{url} - #{e.message}")
        end
    end
end
