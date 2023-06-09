class ReadmeApiUrls
    def self.version(version = nil)
        version.nil? ? "https://dash.readme.com/api/v1/version" : "https://dash.readme.com/api/v1/version/#{version}"
    end

    def self.docs(slug)
        "https://dash.readme.com/api/v1/docs/#{slug}"
    end
end

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
    https.request(request)
end