# Create a new version if it does not already exist.
#
# @param [String] version A string representing the current version.
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
def create_version_if_needed(version, readme_api_key)
    version_information = get_version_information(version, readme_api_key)
    if version_information.empty?
        create_version(version, readme_api_key)
    else
        UI.message("Version #{version} already exists")
    end
end

# Retrieve the information for a given version from the ReadMe API.
#
# @param [String] version The version of the docs to retrieve information for.
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
#
# @return [Hash] Ruby data structure with the version's information.
def get_version_information(version, readme_api_key)
    result = readme_api_request(ReadmeApiUrls.version(version), Net::HTTP::Get, readme_api_key)

    if result.success?
        result.value
    elsif result.error.response_code == '404'
        UI.error("Version #{version} does not exist.")
        {}
    else
        UI.user_error!("Error retrieving version #{version}.\n#{result.error}")
    end
end

# Retrieve the information for a given version from the ReadMe API.
#
# @param [String] version The version of the docs to create.
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
def create_version(version, readme_api_key)
    most_recent_version = get_most_recent_version(readme_api_key)
    UI.message("Creating version #{version} from #{most_recent_version}")

    request_body = {
        version: version,
        from: most_recent_version,
        is_hidden: true
    }

    version_url = ReadmeApiUrls.version
    result = readme_api_request(version_url, Net::HTTP::Post, readme_api_key, request_body)

    if result.success?
        UI.message("Version #{result.value['version']} created")
    else
        UI.user_error!("Error creating version #{version}.\n#{result.error}")
    end
end

# Retrieve the information for a given version from the ReadMe API.
#
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
#
# @return [Hash] Ruby data structure with the version's information.
def get_most_recent_version(readme_api_key)
    result = readme_api_request(ReadmeApiUrls.version, Net::HTTP::Get, readme_api_key)

    if result.success?
        most_recent_version = result.value.max_by { |version| Gem::Version.new(version["version"]) }
        most_recent_version['version']
    else
        UI.user_error!("Error retrieving most recent version from ReadMe.\n#{result.error}")
    end
end