import 'files.rb'
require_relative 'circleci_api/api.rb'
require_relative 'github_api/api.rb'
require_relative 'github_api/graphql.rb'

def post_circleci_artifacts(job_id, circleci_token, github_token)
    Fastlane::UI.message("Posting artifacts for job #{job_id}")

    artifacts = get_artifacts(job_id, circleci_token)

    unless artifacts.length > 0
        Fastlane::UI.message("No artifacts found for job #{job_id}")
        return
    end

    comment = build_pr_comment(artifacts)

    comment_url = get_pr_comment_url(github_token, ENV['CIRCLE_PROJECT_USERNAME'], ENV['CIRCLE_BRANCH'])
    all_comments = get_pr_comments(comment_url, github_token)

    rcgitbot_comment = all_comments.find { |item| item["user"]["login"] == 'RCGitBot' }
    if rcgitbot_comment
        delete_comment(rcgitbot_comment['url'], github_token)
    end

    post_new_comment(comment_url, comment, github_token)
end

def build_pr_comment(artifacts)
    comment_lines = []
    comment_lines << "## Previews"

    artifacts.each do |artifact|
        path = artifact['path']
        url = artifact['url']
        comment_lines << "[#{path}](#{url})"
        comment_lines << "<details><summary>See contents</summary>"
        comment_lines << get_doc_content(path)
        comment_lines << "</details>\n"
    end

    "#{comment_lines.join("\n")}"
end
