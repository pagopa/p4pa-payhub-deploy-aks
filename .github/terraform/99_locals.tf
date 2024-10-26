locals {
  # Repo
  github = {
    org        = "pagopa"
    repository = "arc-deploy-aks"
  }

  repo_secrets = var.env_short == "p" ? {
  } : {}

  map_repo = {
    "dev" : "*",
    "uat" : "uat"
    "prod" : "main"
  }

  branches                  = ["develop", "uat"]
  bypass_branch_rules_teams = ["p4pa-admins", "payments-cloud-admin"]

  # this is use to lookup the id for each team
  team_name_to_id = {
    for team in data.github_organization_teams.all.teams :
    team.name => team.id
  }

  branch_rulesets = {
    main = {
      ref_name                        = "refs/heads/main"
      bypass_actors                   = false
      required_linear_history         = true
      require_code_owner_review       = true
      required_approving_review_count = 0
    },
  }
}
