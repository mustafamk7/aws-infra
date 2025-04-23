include {
  path = find_in_parent_folders()
}

include "iam" {
  path = "${get_repo_root()}/modules/terraform-aws-modules_iam-oidc-role.hcl"
}

inputs = {
  # Replace with your GitHub organization/repository details
  name = "test-github-oidc-role"
  subjects = ["repo:aws-infra/*"] #Add your organisation or repository name

  # Attach the S3 ReadOnly policy to the IAM role
    policies = {
  AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
}

  # Optional audience (defaults to sts.amazonaws.com for GitHub Pro)
  audience = "sts.amazonaws.com"
}
