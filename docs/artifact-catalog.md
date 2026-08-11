# V1 Artifact Catalog

This catalog lists all imported artefacts for the initial `jade-data-refinery-example` build.

## Bundle

Destination: `examples/banking-transaction/bundles/f81d4fae-7dec-11d0-a765-00a0c91e6bf6`

- `account.contract.json`
- `bank.contract.json`
- `customer.contract.json`
- `district.contract.json`
- `loan.contract.json`
- `order.contract.json`
- `transaction.contract.json`
- `f81d4fae-7dec-11d0-a765-00a0c91e6bf6.manifest.json`

## Schema Inputs

Destination: `schemas/banking`

- `BankModelSchema.scm`
- `BankModelSchema.ddx`
- `BankExampleSchema.mul`
- `JadeScript_causeActivation.mth`

## Demo Data

Destination: `data/banking-demo`

- `account.csv`
- `client.csv`
- `district.csv`
- `loan.csv`
- `LuxuryLoanPortfolio.csv`
- `order.csv`
- `transaction.csv`

## Expected Output

Destination: `examples/banking-transaction/expected-output`

- `transaction_create.json`
- `transaction_0001.schema.json`

## Import Policy

- These artefacts are copied from `jade-data-refinery-tools/resources`.
- Source files are not moved or modified.

## Planned Evolution

Bundle/contracts are temporary V1 bootstrap artefacts and will be replaced by EMS-authored and compiled outputs when the EMS workflow for this example is available.
