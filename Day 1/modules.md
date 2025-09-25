# Day 1: Understanding Bicep Modules

## What is a Bicep Module?
A Bicep module is a reusable subset of Bicep code that encapsulates a specific piece of infrastructure. Modules let you break down complex deployments into smaller, manageable components that can be shared across deployments or composed together in a single template.

## How Modules Are Used
Modules are declared in a parent Bicep file using the `module` keyword, followed by a symbolic name, the path to the module file, and any parameters the module requires. This approach promotes composition: one template can call multiple modules to provision a full environment. Parameters, outputs, and scopes can be passed between the parent template and the module, making it easy to reuse the same module across environments by simply changing input values.

```bicep
@description('Name of the storage account (must be globally unique).')
param storageAccountName string

@description('Azure region where the storage account will be deployed.')
param location string

@description('SKU for the storage account.')
param skuName string = 'Standard_LRS'

module storageModule './modules/storageAccountModule.bicep' = {
  name: 'storageDeployment'
  params: {
    storageAccountName: storageAccountName
    location: location
    skuName: skuName
    tags: {
      environment: 'dev'
    }
  }
}

output storageAccountId string = storageModule.outputs.storageAccountId
```

## Benefits of Using Modules
- **Reusability**: Define infrastructure once and reuse it across solutions and teams.
- **Consistency**: Enforce naming conventions, tags, and policies by centralising common components.
- **Collaboration**: Teams can contribute improvements to shared modules without affecting parent templates.
- **Simplified maintenance**: When requirements change, update a single module rather than multiple templates.

## Example: Storage Account Module
Below is an example of a module file (saved at `modules/storageAccountModule.bicep`) that provisions an Azure Storage Account. The module can be referenced from a parent template (as shown above) and parameterised for different environments.

```bicep
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
```

This module illustrates how you can encapsulate the logic for creating a storage account, leaving the parent template to supply environment-specific values such as the name, SKU, and tags.
