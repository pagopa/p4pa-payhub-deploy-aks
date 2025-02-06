# Secret
data "azurerm_key_vault" "key_vault" {
  name                = "${var.prefix}-${var.env_short}-${local.domain}-kv"
  resource_group_name = "${var.prefix}-${var.env_short}-${var.location_short}-${local.domain}-sec-rg"
}

# Github
data "github_organization_teams" "all" {
  root_teams_only = true
  summary_only    = true
}
