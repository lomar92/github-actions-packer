# How to use it
--> Packer v. 1.7.8
This is an updated version of the official Hashicorp packer actions: https://github.com/marketplace/actions/packer-github-actions

# GitHub Action: Packer

> GitHub Action for running Packer [commands](https://www.packer.io/docs/commands).

## Usage: Copy this in your /.github/workflow/name.yml

Add the Action to your [GitHub Workflow](https://docs.github.com/en/actions/learn-github-actions#creating-a-workflow-file) like so:

```yaml
---

name: Packer

on:
  push:

jobs:
  packer:
    runs-on: ubuntu-latest
    name: packer

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      # fix backwards incompatibilities in template
      - name: Fix Template
        uses: lomar92/github-actions-packer@v0.3
        with:
          command: fix

      # validate templates
      - name: Validate Template
        uses: lomar92/github-actions-packer@v0.3
        with:
          command: validate
          arguments: -syntax-only
          target: packer.pkr.hcl

      # build artifact
      - name: Build Artifact
        uses: lomar92/github-actions-packer@v0.3
        with:
          command: build
          arguments: "-color=false -on-error=abort"
          target: packer.pkr.hcl
        env:
          PACKER_LOG: 1
          HCP_CLIENT_ID: ${{ secrets.HCP_CLIENT_ID }}
          HCP_CLIENT_SECRET: ${{ secrets.HCP_CLIENT_SECRET }}

      # additional steps to process artifacts
```

### Inputs

| Name        | Description                    | Required | Default |
|-------------|--------------------------------|----------|---------|
| `command`   | command to execute             | yes      |         |
| `arguments` | arguments for command          | no       |         |
| `target`    | file(s) or directory to target | no       |   `.`   |

