# frozen_string_literal: true

require 'octokit'
require 'json'

# Get all the required info from the environment/action
repo = ENV['GITHUB_REPOSITORY']
label = ENV['LABEL']
comment = ENV['COMMENT']

issue_comment_payload_file = File.read(ENV['GITHUB_EVENT_PATH'])
issue_comment_payload = JSON.parse(issue_comment_payload_file)
issue = issue_comment_payload['issue']

# Initialize Octokit SDK
gh = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])

# Check if the Comment was created on an Issue with the desired label and is open
# If not, exit

unless issue['labels'].any? { |l| l['name'] == label } &&
       issue['state'] == 'open'
  puts 'Issue is not open or does not have the required label'
  exit 0
end

# If comment already exists, exit

comments = gh.issue_comments(repo, issue['number'])

if comments.any? { |c| c[:body] == comment }
  puts 'Comment already exists'
  exit 0
end

# Check if all assignees on the Issue have commented. If yes, add comment

commenters = comments.map { |c| c[:user][:login] }.uniq
assignees = issue['assignees'].map { |a| a['login'] }

if (assignees - commenters).empty?
  gh.add_comment(repo, issue['number'], comment)
  puts 'All assignees have commented'
else
  puts 'Not all assignees have commented'
end
