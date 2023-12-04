def execute_github_graphql_request(github_token, graphql_query, success_message, error_message)
    url = URI('https://api.github.com/graphql')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request.basic_auth(github_token, '')
    request.body = { query: graphql_query }.to_json

    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.message(success_message)
        yield(response) if block_given?
    else
        Fastlane::UI.user_error!("#{error_message}\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end

def get_pull_request_id(pull_request_number, github_token)
    query_id = <<-GRAPHQL
    query QueryId {
        repository(name: "revenuecat-docs", owner: "RevenueCat") {
            pullRequest(number: #{pull_request_number}) {
                id
            }
        }
    }
    GRAPHQL

    execute_github_graphql_request(
        github_token,
        query_id,
        "Pull request ID queried successfully!",
        "Error querying pull request. Pull request ID is nil."
    ) do |response|
        pull_request_id = JSON.parse(response.body)["data"]["repository"]["pullRequest"]["id"]
        return pull_request_id unless pull_request_id.nil?
    end
end

def enable_auto_merge(pull_request_id, github_token)
    query_id = <<-GRAPHQL
    mutation EnableAutoMerge {
        enablePullRequestAutoMerge(input: {pullRequestId: "#{pull_request_id}", mergeMethod: SQUASH}) {
            clientMutationId
        }
    }
    GRAPHQL

    execute_github_graphql_request(
        github_token,
        query_id,
        "Auto merge enabled successfully!",
        "Failed to enable auto merge."
    )
end
