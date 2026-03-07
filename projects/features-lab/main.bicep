targetScope = 'resourceGroup'

@description('Deployment location.')
param location string = resourceGroup().location

@description('Prefix for all resources.')
param namePrefix string

@description('Deploy diagnostics storage account when true.')
param deployDiagnostics bool = true

var tags = {
  learningPath: 'features'
  managedBy: 'bicep'
}

module network '../../modules/network.bicep' = {
  name: 'networkModule'
  params: {
    location: location
    vnetName: '${namePrefix}-vnet'
    addressPrefix: '10.10.0.0/16'
    subnetPrefix: '10.10.1.0/24'
    tags: tags
  }
}

module storage '../../modules/storage.bicep' = if (deployDiagnostics) {
  name: 'diagnosticsStorageModule'
  params: {
    location: location
    storageAccountName: toLower('${namePrefix}diag${uniqueString(resourceGroup().id)}')
    tags: tags
  }
}

output vnetId string = network.outputs.vnetId
output diagnosticsStorageId string = deployDiagnostics ? storage.outputs.storageAccountId : 'not-deployed'
