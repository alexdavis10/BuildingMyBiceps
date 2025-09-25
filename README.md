# BicepLearning
This repo is for me to learn about Azure Bicep publicly and to demonstrate learning fundamentals and best practices.

## Deploying the Day 1 Storage Account Sample
1. Ensure you have the [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli) installed and are logged in:
   ```bash
   az login
   ```
2. Set the target subscription and resource group (create the resource group if it does not exist):
   ```bash
   az account set --subscription <your-subscription-id>
   az group create --name <resource-group-name> --location <azure-region>
   ```
3. Deploy the Day 1 sample, which invokes the storage account module located in `Day 1/modules/storageAccountModule.bicep`:
   ```bash
   az deployment group create \
     --name storageAccountDeployment \
     --resource-group <resource-group-name> \
     --template-file "Day 1/storageAccount.bicep" \
     --parameters storageAccountName=<unique-storage-account-name> \
                  location=<azure-region> \
                  skuName=Standard_LRS
   ```
4. After the deployment succeeds, the command output includes the storage account resource ID from the module output.
