targetScope = 'resourceGroup'

@description('Deployment location.')
param location string = resourceGroup().location

@description('Unique storage account name.')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Optional tags to apply to resources.')
param tags object = {
  learningPath: 'fundamentals'
}

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: tags
}

output storageAccountId string = storage.id
