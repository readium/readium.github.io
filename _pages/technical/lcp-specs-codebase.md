---
layout: page
title:  "Readium LCP Specs and Codebase"
date:   2016-11-15 11:30:00 +0100
categories: specifications
permalink: /technical/readium-lcp-specifications-codebase/
---

Readium LCP (“Licensed Content Protection”) establishes a vendor-neutral interoperable DRM (Digital Rights Management) ecosystem for eBooks and other digital publications, with public specifications and open-source software. 

## Published documents

The specifications of the Readium LCP DRM are now public:

[Readium Licensed Content Protection (LCP) 1.0](/readium-lcp-specification/) defines a standard license format for expressing rights and restrictions associated with protected EPUB 3 Publications. It also defines a processing model for Reading Systems to verify user specific licenses and access encrypted resources.

[Readium License Status Document 1.0](/readium-lsd-specification/) defines a standard status document format for representing the status of a DRM license along with interactions that might affect its status. One of the primary objectives of this specification is to support lending in public libraries where a user may have the ability to renew a time-limited loan or cancel one before it expires.

## Open-source software

### Readium LCP Client library 

The Readium LCP Client library, written in C++, is very easy to deploy as a “content module” in a Reading System based on the Readium SDK. It’s code may be adapted to any other Reading System implementation using the lightweight c++ library contained in the LCP Client library.

&gt; Download it on: [GitHub repository](https://github.com/readium/readium-lcp-client)

### Readium LCP Server 

The multi-platform reference Readium LCP Server is written in Golang. It provides a command line utility for content encryption, a Readium LCP License Server and a License Status Server. The REST API allows for a seamless integration with front-end systems and offers immediate interaction with Readium LCP compliant Reading Systems.  

&gt; Download it on: [GitHub repository](https://github.com/readium/readium-lcp-server)

## Be part of the Readium LCP ecosystem
The interoperability and security of the Readium LCP ecosystem is guaranteed by EDRLab (European Digital Reading Lab), i.e. the European Readium headquarter. This implies a specific encryption profile, different from the basic one defined in the LCP specification, and a secure implementation of this encryption profile. 

For more information about how to be part of the Readium LCP ecosystem ecosystem, please [contact EDRLab](https://edrlab.org/edrlab/contact).

 

