---
layout: post
title:  "Overview of Readium LCP"
date:   2016-11-08 13:30:00 +0100
categories: overview
permalink: /readium-lcp/
---

## Introduction

Several members of Readium Foundation are pursuing, as a sub-project of Readium SDK, the implementation of a vendor-neutral interoperable DRM technology, named Readium LCP (for “Licensed Content Protection”).

The requirements and use-cases have been expressed in 2012, and can still be found on the [IDPF website](http://idpf.org/epub-content-protection).

Readium LCP defines a simple passphrase-based authentication method, which is minimally intrusive for the end user, 
but still fullfills the needs of public libraries and publishers. 

In a few words, Readium LCP is:
- Vendor neutral
- Interoperable
- Accessible
- Minimally intrusive
- Flexible
- Distributed
- Usable offline 
- Cost effective
- Easy to set up.

There are two main kinds of participants in the Readium LCP ecosystem: 
* Readium LCP Servers and 
* Readium LCP Compliant Reading systems

### Readium LCP Server

A Readium LCP Server is managed by a license provider. It encrypts the content of incoming EPUB files and acts as a license server and license status server. 

The license server generates Readium LCP licenses and gives access to existing licenses. It is not exposed directly on the Web, but rather installed behind the provider's frontend server and accessed via a protected REST API. 
The license status server enables device registration, plus early return and loan extension in a library lending scenario. It may be directly exposed on the Web and is accessible via a REST API. 

In order to ease the implementation of Readium LCP services, a reference server codebase written in Golang is provided by Readium (see below).

### Readium LCP Compliant Reading system

A Readium LCP Compliant Reading system (application of e-reader) is able to give access to a Readium LCP protected publication, using a passphrase provided by the end user. Decryption is done on-the-fly so that the decrypted contents are never on disk where they might be sniffed and/or extracted. Such compliant Reading System is also capable of fetching an updated license, and - in a library lending use-case - request early returns and loan extensions.  

In order to ease the implementation of Readium LCP services, a reference client codebase written in C++ is provided by Readium as a module of the Readium Core SDK (see below).

## Interoperability

Different implementations of Readium LCP Servers and Readium LCP Compliant Reading systems must be 100% interoperable.
EDRLab (European Digital Reading Lab, i.e. the European Readium headquarter) is in charge of verifying the compliance  and interoperability of each participant in the ecosystem.

## PKI

Content protection is based on PKI (Public Key Infrastructure) technologies. T-Systems (a German global IT services and subsidiary of Deutsche Telekom) has been chosen to act as a Certificate Authority and provide digital certificates to each license provider via EDRLab, EDRLab acting as manager of the Readium LCP ecosystem. 

## Workflow

The diagram below illustrates a high-level view of an LCP-enabled workflow.

![readium-lcp](/assets/images/readium-lcp.png)

## Useful links

If you want to know more about Readium LCP, or if you want to implement a Readium LCP compliant service, 
please read [Readium LCP Specs and Codebase](/lcp-specs-codebase/).

You will also find detailed information about the Readium LCP ecossytem on the [EDRLab website](https://edrlab.org/edrlab/readium-lcp-principles/).
