# Modules

Modules in Bicep:

When using Bicep for larger projects that contains many resources, often it is best practice to spilt up the resource building process into what is called "modules" Modules are used to help keep bicep templates clean and reusable for many instances. Instead of writing one super long .bicep file, you can split your resources into smaller, purpose-specific files. For example, you can have a storage.bicep, network.bicep, etc, then call them from a main deploy.bicep or main.bicep file using the module keyword. This makes code easier to read, makes debugging easier, and allows for better reuse across environments.
