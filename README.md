# Jade Data Refinery Examples

This repository contains banking example assets for Jade Data Refinery (JDR).

The assets include an application schema, event mapping specifications, and demo data. Online documentation links are not yet available; see the related resource descriptions below.

## Prerequisites

Before using these examples, prepare an environment supported by your installed JDR release.

The example environment requires:

* A licensed JDR deployment and compatible Jade Platform environment
* A Jade primary database and a refinery secondary with Change Capture Process (CCP) configured
* JDR ESP installed and configured
* File-system access to the example assets and required JDR runtime directories

Use the JDR Getting Started guidance for environment setup and version compatibility.

## Using the Examples

Use the following assets with the JDR banking example workflow:

1. Load the banking application schema and demo data into the example environment.

2. Use the Event Mapping Specs (EMS) under:

   ```text
   examples/banking-transaction/event-mapping-specs/
   ```

## Repository Layout

The repository groups the example assets by mapping, schema, and demo data.

```text
jade-data-refinery-examples/
|
+-- README.md
|
+-- examples/
|   +-- banking-transaction/
|       |
|       +-- event-mapping-specs/
|       |   +-- account.mapping.json
|       |   +-- bank.mapping.json
|       |   +-- customer.mapping.json
|       |   +-- district.mapping.json
|       |   +-- loan.mapping.json
|       |   +-- order.mapping.json
|       |   +-- transaction.mapping.json
|
+-- schemas/
|   +-- banking/
|       +-- BankModelSchema.scm
|       +-- BankModelSchema.ddx
|
+-- data/
|   +-- banking-demo/
|       +-- ...
|
+-- docs/
    +-- tutorial-banking-transaction.md
    +-- artifact-catalog.md
```

For detailed setup, mapping, activation, and verification instructions, consult the JDR documentation.

## Scope and Compatibility

This repository contains the banking application schema, mapping specifications, and demo CSV data.

Schema, mapping, and runtime compatibility depends on the installed JDR and Jade Platform versions. Confirm compatibility using the current JDR release notes and mapping guidance before deploying a bundle.

## Related Resources

The following JDR resources provide guidance; online documentation links are not yet available:

* JDR user documentation for product concepts and operation
* JDR Getting Started guidance for environment setup
* JDR banking tutorial for working through the example
* JDR release notes and mapping compatibility guidance for version-specific changes

## Feedback and Issues

For help with an example, contact your Jade support representative. Include the following details:

* The JDR version
* The Jade Platform version
* The affected example
* The steps followed and the observed result
