# V1 Artifact Catalog

This catalog lists all imported artefacts for the initial `jade-data-refinery-example` build.

## Event Mapping Specs (EMS)

Destination: `examples/banking-transaction/event-mapping-specs`

- `account.mapping.json`
- `bank.mapping.json`
- `customer.mapping.json`
- `district.mapping.json`
- `loan.mapping.json`
- `order.mapping.json`
- `transaction.mapping.json`

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

The EMS files are the maintained source for this example. Compile them locally with `JdrBundleSmith` to produce the mapping bundle used for activation; compiled bundle/contract artefacts are not checked in to this repository.
