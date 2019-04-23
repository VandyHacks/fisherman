workflow "on package.json change, do something" {
  on = "push"
  resolves = ["detect dependency changes"]
}

action "detect dependency changes" {
  uses = "bencooper222/check-for-node-dep-changes@master"
  secrets = ["GITHUB_TOKEN"]
}

action "Post message to Slack" {
  needs = "detect dependency changes"
  uses = "pullreminders/slack-github-action@master"
  secrets = [
    "SLACK_BOT_TOKEN",
  ]
  args = "{\"channel\":\"C9S0DF3BR\",\"text\":"Hello world"}"
}
