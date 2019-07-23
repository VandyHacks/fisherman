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
    PULL_REQUEST_DRAFT = "true"
    PULL_REQUEST_TITLE = "Override ${BRANCH}"
  }
}


workflow "Automatic Rebase" {
  on = "issue_comment"
  resolves = "Rebase"
}

action "Rebase" {
  uses = "docker://cirrusactions/rebase:latest"
  secrets = ["GITHUB_TOKEN"]
}