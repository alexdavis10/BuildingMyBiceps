# Modules

Modules in Bicep:

When using Bicep for larger projects that contains many resources, often it is best practice to spilt up the resource building process into what is called "modules". Modules are used to help keep bicep templates clean and reusable for many instances. Instead of writing one super long .bicep file, you can split your resources into smaller, purpose-specific files.

This repository now contains a **modules** folder with two files:

- **storage.bicep** - defines a storage account and outputs its ID
- **network.bicep** - defines a virtual network with a single subnet and outputs its ID

These modules are referenced from **main.bicep** using the `module` keyword. By separating them in this way, you can easily reuse `storage.bicep` or `network.bicep` in other deployments without copying code.

### Demo setup

To try out these modules, ensure you have the [Bicep CLI](https://learn.microsoft.com/azure/azure-resource-manager/bicep/install) installed. Then create or select an Azure resource group and deploy `main.bicep`:

```bash
az group create -n MyResourceGroup -l eastus
az deployment group create -g MyResourceGroup -f main.bicep
```

This command will deploy both the storage account and virtual network as defined in the modules.
