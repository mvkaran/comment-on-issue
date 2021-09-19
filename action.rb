require 'octokit'
require 'json'

# Get all the required info from the environment/action
repo = ENV['GITHUB_REPOSITORY']
label = ENV['LABEL']
comment = ENV['COMMENT']

issue_comment_payload_file = File.read(ENV['GITHUB_EVENT_PATH'])
issue_comment_payload = JSON.parse(issue_comment_payload_file)

issue_comment_payload.inspect

# Initialize Octokit SDK
gh = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

# Check if the Comment was created on an Issue with the desired label and is open
# If not, exit


# Failsafe: If this workflow got triggered because of an already created comment,
# then exit


# Check if all assignees on the Issue have commented. If yes, add comment
