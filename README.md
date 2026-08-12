# Jade Data Refinery Examples

This repository contains example assets referenced by Jade Data Refinery (JDR) user documentation and tutorials.

The current reference scenario is a runnable banking transaction example aligned to the JDR tutorial walkthrough.

Use this repository for the schema inputs, demo data, bundle artefacts, and representative output used by that scenario.

## Prerequisites

Before using these examples, complete the JDR Getting Started setup.

You need:

* Jade Platform 2025.0.03 (2025 R3) or later
* A valid JDR licence
* A working Jade primary database
* A dedicated Refinery Secondary
* Refinery Change Capture Process (CCP) configured and running
* JDR ESP installed and configured
* File-system access to the example and JDR runtime directories
* Access to the JDR user documentation

The banking tutorial uses local FileSender output, so Kafka or Azure Event Hubs is not required.

See the [JDR Getting Started Guide](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3702784015/Jade+Data+Refinery+JDR+-+Getting+Started+Guide) if you have not yet set up a working JDR environment.

## Quick Start

1. Complete the [JDR Getting Started Guide](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3702784015/Jade+Data+Refinery+JDR+-+Getting+Started+Guide).

2. Follow the [JDR Banking Tutorial](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3703144465/Jade+Data+Refinery+JDR+-+Tutorial).

3. Load the banking example schema and data from this repository.

4. Use the banking transaction bundle artefacts under:

   ```text
   examples/banking-transaction/bundles/f81d4fae-7dec-11d0-a765-00a0c91e6bf6/
   ```

5. Deploy the example mapping bundle to the `BundleStorageDirectory` configured for your Refinery Secondary.

6. Activate the bundle using the JDR bundle activation procedure.

7. Generate the tutorial transactions:

   * A cash transaction
   * A transfer transaction

8. Inspect the generated FileSender output.

9. Compare the structure and enrichment with the reference files under:

   ```text
   examples/banking-transaction/expected-output/
   ```

The expected output is intended to verify event structure and enrichment. Runtime-generated identifiers, timestamps, sequence numbers, and transaction-specific values may differ between runs.

## Repository Layout

The repository is organised by example assets, schema inputs, and demo data.

```text
jade-data-refinery-examples/
|
+-- README.md
|
+-- examples/
|   +-- banking-transaction/
|       |
|       +-- bundles/
|       |   +-- f81d4fae-7dec-11d0-a765-00a0c91e6bf6/
|       |       +-- f81d4fae-7dec-11d0-a765-00a0c91e6bf6.manifest.json
|       |
|       +-- expected-output/
|           +-- transaction_create.json
|           +-- transaction_0001.schema.json
|
+-- schemas/
|   +-- banking/
|       +-- BankModelSchema.scm
|       +-- BankModelSchema.ddx
|       +-- BankExampleSchema.mul
|       +-- JadeScript_causeActivation.mth
|
+-- data/
|   +-- banking-demo/
|       +-- ...
|
+-- docs/
    +-- tutorial-banking-transaction.md
    +-- artifact-catalog.md
```

Refer to the JDR tutorial for detailed mapping, activation, and verification steps.

## Current Scope and Limitations

This repository currently provides the R1 banking transaction example.

The current scope is intentionally focused:

* The banking Transaction example is the primary reference scenario.
* FileSender is used for the basic tutorial verification path.
* Kafka and Azure Event Hubs configuration is covered by the JDR documentation rather than duplicated here.
* Test-only bundle variants are not included.
* Expected output is representative rather than byte-for-byte deterministic.

Some checked-in bundle and contract artefacts are supplied as bootstrap reference assets while the complete EMS authoring and compilation workflow is finalised for the example.

Current V1 state:

* The repository includes bundle and contract artefacts used by the tutorial scenario.
* The dedicated EMS source path is not yet included in this repository.
* When EMS authoring assets are added, the EMS will become the maintained source and generated EMC files should remain generated artefacts.

## Compatibility

The examples are intended for:

```text
Jade Platform 2025.0.03 (2025 R3) or later
Jade Data Refinery R1
```

Example mappings, generated contracts, and banking schema assets may depend on the corresponding JDR mapping schema and runtime versions.

When using these examples with a later JDR release, review the release notes and mapping compatibility guidance before deploying the supplied bundle unchanged.

## Related Documentation

* [Jade Data Refinery - User Documentation](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3701276687/User+Documentation)
* [Jade Data Refinery - Getting Started Guide](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3702784015/Jade+Data+Refinery+JDR+-+Getting+Started+Guide)
* [Jade Data Refinery - User Manual](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3702128689/Jade+Data+Refinery+JDR+-+User+Manual)
* [Jade Data Refinery - Tutorial](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3703144465/Jade+Data+Refinery+JDR+-+Tutorial)
* [Jade Data Refinery - R1 Release Notes](https://jadesoftware.atlassian.net/wiki/spaces/IDR/pages/3702030369/Jade+Data+Refinery+JDR+-+R1+Release+Notes)

## Feedback and Issues

If an example does not behave as described by the corresponding JDR documentation, capture:

* The JDR version
* The Jade Platform version
* The example and bundle version
* Refinery Secondary JOM messages relevant to bundle validation or activation
* JDR ESP `producer.log` messages relevant to event processing
* The generated output, where applicable

Use the standard Jade support or project issue-reporting process for this repository.
