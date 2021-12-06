# How to use it
Packer v. 1.7.8

# Copy this in your /.github/workflow/name.yml



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
        uses: hashicorp/packer-github-actions@master
        with:
          command: fix

      # validate templates
      - name: Validate Template
        uses: hashicorp/packer-github-actions@master
        with:
          command: validate
          arguments: -syntax-only
          target: packer.pkr.hcl

      # build artifact
      - name: Build Artifact
        uses: hashicorp/packer-github-actions@master
        with:
          command: build
          arguments: "-color=false -on-error=abort"
          target: packer.pkr.hcl
        env:
          PACKER_LOG: 1

      # additional steps to process artifacts
