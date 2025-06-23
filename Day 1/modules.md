# Bicep Modules

When working with Bicep in larger projects containing many resources, it is best practice to split the resource definitions into **modules**.

## What are Modules?

Modules are smaller, purpose-specific Bicep files that help keep your templates clean, readable, and reusable. Instead of writing one large `.bicep` file, you can divide your resources into separate files like:

- `storage.bicep`
- `network.bicep`
- etc.

## Why Use Modules?

- **Improved readability:** Smaller files are easier to understand.
- **Simplified debugging:** Issues can be isolated within specific modules.
- **Better reuse:** Modules can be called multiple times across different environments or deployments.

## How to Use Modules

You can call these modules from a main deployment file, for example, `main.bicep` or `deploy.bicep`, using the `module` keyword.

---

Using modules helps organize your infrastructure as code in a scalable and maintainable way.
