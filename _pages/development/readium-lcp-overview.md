---
layout: post
title:  "Overview of Readium LCP"
date:   2019-01-02 13:30:00 +0100
categories: overview
permalink: /development/readium-lcp-overview/
---

## Introduction

Several members of the Readium Foundation have created a vendor-neutral, interoperable and distributed DRM technology named Readium LCP (for “Licensed Content Protection”); the only DRM solution developed specifically *by* the publishing industry, *for* the industry. 

Readium LCP defines a simple passphrase-based authentication method, which is minimally intrusive for the end user,
but still fulfills the needs of public libraries and publishers. 

The requirements and use-cases for this DRM technology have been expressed in 2012 and can still be found on the [IDPF website](http://idpf.org/epub-content-protection).

Its specification is open, so that any company can implement the technology freely. The specification is two-fold:

* [Readium Licensed Content Protection Specification](/technical/readium-lcp-specification/) defines license documents;
* [Readium License Status Document Specification](/technical/readium-lsd-specification/) defines associated status documents;

Readium LCP will certainly become more than an industry standard: it has been submitted to the ISO by Japan and South Korea and will certainly become an international standard before 2021.

Readium LCP is built using standard and best practice technology for encryption:

* AES 256 bits encryption for the content and the content key
* SHA-256 for the user passphrase
* RSA with SHA-256 for the signature of the license.

A large open-source codebase has been developed by [EDRLab](https://www.edrlab.org), an active member of the Readium Foundation. This includes a fully featured License Server, DRM libraries compliant with the original an new Readium SDKs on Mobile and Desktop, plus a lightweight DRM library usable on any target device. 

Readium LCP can protect EPUB 2 and EPUB 3 publications, with text, images and audio-visual content. From 2019, this technology will also be able to protect PDF content (with an adaptation of the Readium development kits for PDF support).

The management of the LCP Network is handled by EDRLab, which is itself an international membership organization fueled by companies from the publishing industry.  

Readium LCP is free from transaction costs. The only mandatory cost for using the DRM is a yearly cost of certification, by EDRLab, for each node of the LCP Network (i.e. the network of all interoperable LCP client devices and server solutions). 
 
Readium LCP is designed for privacy and GDPR compliance (required for EU adoption) since no third-party is collecting data on behalf of the distributor.

From 2018, LCP is becoming the standard DRM for major markets, including but not limited to: France, Germany, Belgium, Switzerland and Québec.

It is planned to see LCP become an ISO international standard by 2020. 

## Useful links

If you want to know more about Readium LCP, please read [Readium LCP Specs and Codebase](/technical/readium-lcp-specs-codebase/).

Several LCP open-source modules are found on the [Readium Github using the 'lcp' search key](https://github.com/readium?utf8=%E2%9C%93&q=lcp).

Some documentation about these modules are found on the [Readium Github in the architecture section](https://github.com/readium/architecture/tree/master/other/lcp).

You will also find detailed information about the Readium LCP ecosystem on the [EDRLab website](https://edrlab.org/readium/readium-lcp/).

If you want to implement a Readium LCP compliant service, please contact EDRLab directly (contact at edrlab.org).

