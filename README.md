# Terragrunt Configuration for Example

This repository contains the Terragrunt configuration for deploying Example infrastructure.

## Initialization and Planning

To initialize the environment and generate a plan, run the following commands:

```bash
terragrunt init --working-dir=environments/example.com/prod
terragrunt plan --working-dir=environments/example.com/prod
```

## Terraform Configuration

The configuration uses Terraform under the hood. The following variables are required:

- `zone`: The Scaleway zone to deploy in (e.g., "fr-par-1")
- `region`: The Scaleway region to deploy in (e.g., "fr-par")

## Provider Configuration

The Scaleway provider is configured with the specified zone and region:
```terraform
provider "scaleway" {
  zone   = var.zone
  region = var.region
}
```

## Scaleway Profile Configuration

Scaleway CLI uses profiles to manage different sets of credentials. You can:

### View Available Profiles

```bash
cat ~/.config/scw/config.yaml
```

This will show all configured profiles and indicate which one is currently active.

### Switch Between Profiles

To change the active profile:

```bash
scw config profile activate <profile-name>
```

For example, to switch to the example.com profile:

```bash
scw config profile activate example.com
```

Make sure to set these variables appropriately before running `terragrunt apply`.
