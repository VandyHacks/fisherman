workflow "on package.json change, do something" {
  on = "pull_request"
  resolves = ["branch cleanup"]
}

action "dependency change detector" {
  uses = "bencooper222/check-for-node-dep-changes@master"
  secrets = ["GITHUB_TOKEN"]
}
