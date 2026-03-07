targetScope = 'resourceGroup'

@description('Deployment location.')
param location string = resourceGroup().location

@description('Environment short name (dev/test/prod).')
@allowed([
  'dev'
  'test'
  'prod'
])
param environment string = 'dev'

@description('Prefix used for resource names.')
param namePrefix string

@description('Default governance tags.')
param governanceTags object = {
  environment: environment
  costCenter: 'it-shared'
  owner: 'platform-team'
}

var vnetName = '${namePrefix}-${environment}-vnet'
var storageName = toLower(take('${namePrefix}${environment}${uniqueString(resourceGroup().id)}', 24))

module network '../../modules/network.bicep' = {
  name: 'capstoneNetwork'
  params: {
    location: location
    vnetName: vnetName
    addressPrefix: '10.20.0.0/16'
    subnetPrefix: '10.20.1.0/24'
    tags: governanceTags
  }
}

module storage '../../modules/storage.bicep' = {
  name: 'capstoneStorage'
  params: {
    location: location
    storageAccountName: storageName
    tags: governanceTags
  }
}

output networkId string = network.outputs.vnetId
output storageId string = storage.outputs.storageAccountId
