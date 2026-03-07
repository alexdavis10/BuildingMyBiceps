@description('Azure region for the virtual network.')
param location string

@description('Virtual network name.')
param vnetName string

@description('Address space CIDR prefix.')
param addressPrefix string

@description('Default subnet CIDR prefix.')
param subnetPrefix string

@description('Tags to apply to network resources.')
param tags object = {}

resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
