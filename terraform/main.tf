locals {
  raw_entities = jsondecode(file("${path.module}/../production-config/entities.json"))

  managed_entities = [
    for entity in local.raw_entities : entity
    if entity.blueprint != null && entity.identifier != null && !startswith(entity.blueprint, "_")
  ]
}

resource "port_entity" "managed" {
  for_each = {
    for entity in local.managed_entities : "${entity.blueprint}/${entity.identifier}" => entity
  }

  blueprint  = each.value.blueprint
  identifier = each.value.identifier
  title      = try(each.value.title, each.value.identifier)
}
