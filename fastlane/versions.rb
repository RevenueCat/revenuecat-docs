# Create a new version if it does not already exist.
#
# @param [String] version A string representing the current version.
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
def create_version_if_needed(version, readme_api_key)
    version_information = get_version_information(version, readme_api_key)
    if version_information['error']
        UI.message("Creating version #{version}")
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
    url = URI("https://dash.readme.com/api/v1/version/#{version}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request.basic_auth(readme_api_key, '')

    request["accept"] = 'application/json'

    response = https.request(request)
    JSON.parse(response.read_body)
end

# Retrieve the information for a given version from the ReadMe API.
#
# @param [String] version The version of the docs to retrieve information for.
# @param [String] readme_api_key API key for the ReadMe account that has access to the document.
#
# @return [Hash] Ruby data structure with the version's information.
def create_version(version, readme_api_key)
    url = URI("https://dash.readme.com/api/v1/version")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request.basic_auth(readme_api_key, '')

    request["accept"] = 'application/json'
    request["content-type"] = 'application/json'

    request.body = "{\"version\":\"#{version}\",\"from\":\"v5.0\"}"

    response = https.request(request)
    if response.code == '200'
        parsed_body = JSON.parse(response.read_body)
        UI.message("Version #{parsed_body['version']} created")
    else
        UI.user_error!("Error creating version #{version}.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end