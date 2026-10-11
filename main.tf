resource "google_service_directory_namespace_iam_member" "service_directory_namespace_iam_members" {
  for_each = var.service_directory_namespace_iam_members

  member = each.value.member
  name   = each.value.name
  role   = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

