@description('Name of the storage account (must be globally unique).')
param storageAccountName string

@description('Azure region where the storage account will be deployed.')
param location string

@description('SKU for the storage account.')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
])
param skuName string = 'Standard_LRS'

@description('Kind of storage account to deploy.')
@allowed([
  'StorageV2'
  'FileStorage'
  'BlockBlobStorage'
])
param kind string = 'StorageV2'

@description('Tags to apply to the storage account.')
param tags object = {}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: skuName
  }
  kind: kind
  tags: tags
}

output storageAccountId string = storageAccount.id
