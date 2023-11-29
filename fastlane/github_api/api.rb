def get_pr_comment_url(github_token, username, branch)
    url = URI.parse("https://api.github.com/repos/RevenueCat/revenuecat-docs/pulls?head=#{username}:#{branch}&state=open")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url.request_uri)
    request.basic_auth(github_token, '')

    response = http.request(request)
    pr_response = JSON.parse(response.body)

    if pr_response.length == 0
        Fastlane::UI.user_error!("No open PR found for branch #{branch}")
    end

    pr_response[0]['_links']['comments']['href']
end

def get_pr_comments(comment_url, github_token)
    url = URI.parse(comment_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url.request_uri)
    request.basic_auth(github_token, '')
    request['Content-Type'] = 'application/json'

    response = http.request(request)
    JSON.parse(response.body)
end

def delete_comment(comment_url, github_token)
    url = URI(comment_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Delete.new(url.request_uri)
    request.basic_auth(github_token, '')
    request['Content-Type'] = 'application/json'

    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.message("Deleted previous comment")
    else
        Fastlane::UI.error("Error deleting previous comment.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end

def post_new_comment(comment_url, body, github_token)
    url = URI(comment_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request.basic_auth(github_token, '')
    request['Content-Type'] = 'application/json'

    request.body = {
        body: body
    }.to_json

    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.message("New comment posted")
    else
        Fastlane::UI.user_error!("Error posting new comment.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end

def get_pull_request_id(pull_request_number, github_token)
    url = URI('https://api.github.com/graphql')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request.basic_auth(github_token, '')

    query_id = <<-GRAPHQL
    query QueryId {
        repository(name: "revenuecat-docs", owner: "RevenueCat") {
            pullRequest(number: #{pull_request_number}) {
                id
            }
        } 
    }
    GRAPHQL

    request.body = { query: query_id }.to_json
    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.message("Pull request ID queried successfully!")
        return JSON.parse(response.body)["data"]["repository"]["pullRequest"]["id"]
    else
        Fastlane::UI.user_error!("Error querying pull request.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end

def enable_auto_merge(pull_request_id, github_token)
    url = URI('https://api.github.com/graphql')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.request_uri)
    request.basic_auth(github_token, '')

    query_id = <<-GRAPHQL
    mutation EnableAutoMerge {
        enablePullRequestAutoMerge(input: {pullRequestId: "#{pull_request_id}", mergeMethod: SQUASH}) {
            clientMutationId
        }
    }
    GRAPHQL

    request.body = { query: query_id }.to_json
    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
        Fastlane::UI.message("Auto merge enabled successfully!")
    else
        Fastlane::UI.user_error!("Failed to enable auto merge.\nCode: #{response.code}\nBody: #{response.read_body}")
    end
end