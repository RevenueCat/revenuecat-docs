require_relative 'result.rb'
require_relative 'error.rb'

class ReadmeApiUrls
    def self.version(version = nil)
        version.nil? ? "https://dash.readme.com/api/v1/version" : "https://dash.readme.com/api/v1/version/#{version}"
    end

    def self.docs(slug)
        "https://dash.readme.com/api/v1/docs/#{slug}"
    end
end

# Performs an API request to a specified URL with the given HTTP method, API key, and optional request body and version.
#
# @param url [String] The URL to make the API request.
# @param http_method [Class] The HTTP method class (e.g., Net::HTTP::Post, Net::HTTP::Put).
# @param readme_api_key [String] The API key for authentication.
# @param body [Hash, nil] The request body, if any.
# @param readme_version [String, nil] The version of the API, if required.
#
# @return [Result] The result of the API request, containing either a value (response) or an error.
def readme_api_request(url, http_method, readme_api_key, body = nil, readme_version = nil)
    url = URI(url)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = http_method.new(url)
    if http_method == Net::HTTP::Post || http_method == Net::HTTP::Put
        request.content_type = "application/json"
    end
    request.basic_auth(readme_api_key, '')
    request["accept"] = 'application/json'
    if readme_version
        request["x-readme-version"] = readme_version
    end
    if body
        request.body = body.to_json
    end

    response = https.request(request)

    json_parse = JSON.parse(response.read_body)
    if response.is_a?(Net::HTTPSuccess)
        Result.new(json_parse)
    elsif json_parse['error']
        error = Error.from_json(json_parse, response.code)
        Result.new(nil, error)
    else
        UI.user_error!("Error retrieving #{url}.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end