workflow "on package.json change, do something" {
  on = "push"
  resolves = ["post message"]
}

action "detect dependency changes" {
  uses = "bencooper222/check-for-node-dep-changes@master"
  secrets = ["GITHUB_TOKEN"]
}

action "post message" {
  needs = ["detect dependency changes"]
  uses = "pullreminders/slack-github-action@master"
  secrets = [
    "SLACK_BOT_TOKEN",
  ]
  args = "{\"channel\": \"C9S0DF3BR\", \"text\": \"Dependencies have been changed; `npm i` is recommended\"}}"
}


workflow "Automatic Rebase" {
  on = "issue_comment"
  resolves = "Rebase"
}

action "Rebase" {
  uses = "docker://cirrusactions/rebase:latest"
  secrets = ["GITHUB_TOKEN"]
}