@description('Azure region for the storage account.')
param location string

@description('Storage account name.')
@minLength(3)
@maxLength(24)
param storageAccountName string

@description('Tags to apply to the storage account.')
param tags object = {}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageAccountId string = storageAccount.id
