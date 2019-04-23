workflow "on package.json change, do something" {
  on = "push"
  resolves = ["detect dependency changes"]
}

action "detect dependency changes" {
  uses = "bencooper222/check-for-node-dep-changes@master"
  secrets = ["GITHUB_TOKEN"]
}
