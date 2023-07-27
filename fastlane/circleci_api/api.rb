def get_artifacts(job_id, circleci_token)
    url = URI.parse("https://circleci.com/api/v2/project/gh/RevenueCat/revenuecat-docs/#{job_id}/artifacts")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url.request_uri)
    request.basic_auth(circleci_token, '')

    response = http.request(request)
    unless response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.user_error!("Error retrieving artifacts.\nCode: #{response.code}\nBody: #{response.read_body}")
    end

    JSON.parse(response.body)["items"]
end