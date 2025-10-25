#region Resource Group
module "infra_database_resource_group" {
  source   = "./modules/azure-resource-group"
  name     = var.resource_group_name
  location = var.resource_group_location
}
#endregion

#region Cosmos DB
module "infra_cosmosdb" {
  source   = "./modules/azure-cosmosdb"
  name     = var.cosmosdb_name
  location = var.resource_group_location
  resource_group_name = module.infra_database_resource_group.name
  offer_type = "Standard"
  kind = "MongoDB"
  capabilities_name = "EnableMongo"
}
#endregion

#region DataBase
module "infra_database_mongodb" {
  source   = "./modules/azure-mongodb-database"
  name     = var.database_name
  resource_group_name = module.infra_database_resource_group.name
  cosmosdb_account_name = module.infra_cosmosdb.name
}
#endregion


#region Collection
module "infra_collection_mongodb" {
  source   = "./modules/azure-collection-cosmosdb-mongodb"
  resource_group_name = module.infra_database_resource_group.name
  account_name = module.infra_cosmosdb.name
  database_name = var.database_name
  throughput = 400
}
#endregion