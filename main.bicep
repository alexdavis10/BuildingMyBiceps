targetScope = 'resourceGroup'

// Call the storage module
module storageModule './modules/storage.bicep' = {
  name: 'storageModule'
  params: {
    storageAccountName: 'examplestorageacct'
    location: resourceGroup().location
  }
}

// Call the network module
module networkModule './modules/network.bicep' = {
  name: 'networkModule'
  params: {
    vnetName: 'exampleVNet'
    location: resourceGroup().location
    addressPrefix: '10.0.0.0/16'
    subnetPrefix: '10.0.1.0/24'
  }
}
