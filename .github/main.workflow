workflow "Create Pull Request" {
  on = "push"
  resolves = "Create New Pull Request"
}

action "Create New Pull Request" {
  uses = "bencooper222/pull-request-action@master"
  secrets = [
    "GITHUB_TOKEN"
  ]
  env = {
    BRANCH_PREFIX = ""
    PULL_REQUEST_BRANCH = "master"
    MAKE_DRAFT_PR = "true"
  }
}
