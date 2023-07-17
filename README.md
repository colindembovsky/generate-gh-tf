# Generate TF for Org Settings from Terraform

This demo shows how you can generate config for GH Provider.

## Steps

1. Clone repo
2. Update `owner` in [providers.tf](providers.tf) and `id` in [import-org.tf](import-org.tf) to the org you want to import
3. Create a PAT with at least `admin:org -> read`
4. Run `export TF_VAR_github_token=<PAT>` to set the PAT in the environment vars
5. Run `tf init` (requires `tf` version >= 1.5)
6. Run `plan -generate-config-out=generated_org.tf` to generate config

From there, you should see reverse-engineered settings for the `org` resource in the `generated_org` file. Copy these contents to a "real" tf file and manage the org settings from there.

### Sample output

```hcl
# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "colinsalmcorner"
resource "github_organization_settings" "org" {
  advanced_security_enabled_for_new_repositories               = false
  billing_email                                                = ""
  blog                                                         = "https://colinsalmcorner.com"
  company                                                      = null
  default_repository_permission                                = null
  dependabot_alerts_enabled_for_new_repositories               = false
  dependabot_security_updates_enabled_for_new_repositories     = false
  dependency_graph_enabled_for_new_repositories                = false
  description                                                  = null
  email                                                        = null
  has_organization_projects                                    = true
  has_repository_projects                                      = true
  location                                                     = null
  members_can_create_internal_repositories                     = false
  members_can_create_pages                                     = true
  members_can_create_private_pages                             = true
  members_can_create_private_repositories                      = true
  members_can_create_public_pages                              = true
  members_can_create_public_repositories                       = true
  members_can_create_repositories                              = true
  members_can_fork_private_repositories                        = false
  name                                                         = "Colin's ALM Corner"
  secret_scanning_enabled_for_new_repositories                 = false
  secret_scanning_push_protection_enabled_for_new_repositories = false
  twitter_username                                             = null
  web_commit_signoff_required                                  = false
}

```