---
layout: post
title:  "Overview of Readium LCP"
date:   2016-11-08 13:30:00 +0100
categories: overview
permalink: /readium-lcp/
---

### Useful Links

You can find the full Readium LCP Specifications here: [Readium LCP Specifications](/lcp-specs/).

More informations about Readium LCP on the [EDRLab website](https://edrlab.org/edrlab/readium-lcp-principles/).

### Introduction

There are four major parts to the Readium LCP workflow:

- The server, which packages the books provided by the publisher,
- The client code which manages the user's authentication and opens and decrypts the book,
- The certificate authority, provides the necessary certificates for the packaging code,
- The infrastructure which manages the storing of the packaged books, handling user transactions and the download of books to the user.

The diagram below illustrates a high-level view of a LCP-enabled workflow.

![readium-lcp](/assets/images/readium-lcp.png)

### LCP Server

This is the server which encrypts and packages a raw EPUB. The server can also take an exploded EPUB contents and package the contents, encrypting some parts of it. The server has been written in the GO language and is available from the Readium github repository.

### LCP Client

This is the piece which reads the necessary information from the encrypted EPUB and decrypts the encrypted portions of the EPUB and provides them to the Readium rendering module. This decryption is done on-the-fly so that the decrypted contents are never on disk where they might be sniffed and/or extracted.

In addition to the basic decryption of the EPUB, there are also several steps required to authenticate the user, obtain and/or store the pass-phrase and so on. These are normally specific to the vendor implementing the Reading System based on the Readium SDK. The Readium SDK does provide some facilities to enable these workflows, but much of the implementation is vendor-specific and outside the SDK itself.

### Server Infrastructure

In addition to the server which packages the books for deployment and the DRM-enabled SDK which decrypts the books for reading, there is also some necessary server-side infrastructure needed to support the servers by providing certificates for the encryption process. In order for books to be shared across reading systems, and especially across different Reading Systems, there needs to be a central “certificate authority (CA)” which provides the necessary certificates.