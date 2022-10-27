resource "random_string" "app" {
  length  = 8
  special = false
  numeric = false
  lower   = true
  upper   = false
}

resource "aws_resourcegroups_group" "app" {
  name        = local.workspace
  description = "Resources in Paragon enterprise workspace ${local.workspace}"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": ["AWS::AllSupported"],
  "TagFilters": [
    {
      "Key": "Workspace",
      "Values": ["${local.workspace}"]
    },
    {
      "Key": "Environment",
      "Values": ["enterprise"]
    }
  ]
}
JSON
  }
}