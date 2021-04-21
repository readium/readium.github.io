---
layout: post
title:  "Readium JS"
date:   2016-11-08 13:30:00 +0100
categories: overview
permalink: /development/readium-js-overview/
---

## Overview

Readium JS comprises two sub-projects, Readium Chrome Application and the Readium CloudReader. Both consist of three major pieces:

- readium-js, which is the core (equivalent to the C++ Core in the SDK) and provides basic services, manages the EPUB package, metadata, navigating and fetching resources and so on,
- readium-shared-js: This is exactly the same code as used in the SDK implementation (hence the 'shared' name),
- readium-js-viewer: This is the application layer which manages the user-interface.

The Chrome Application and the CloudReader share approximately 95% of their code, the primary difference is where their EPUB "library" is located and how they fetch EPUB resources. The diagram below illustrates the major aspects of their architectures.


![readium-js](../../assets/images/readium-js.png)


### Readium Chrome Application (RCA)

This sub-project consists of an Application to Google Chrome. It is a full-fledged, functional EPUB reading system. It supports virtually all of the EPUB 3.0.1 specification. Unlike the Readium SDK Launchers, RCA is a relatively polished, full-featured application. It is under constant development to provide more features and capabilities. It only works with Google Chrome since it leverages the built-in capabilities provided by the Chrome framework. It imports the user’s books into a private file-system on the user’s computer.

### Readium CloudReader

The CloudReader is very similar to the Chrome Application – and they share almost all their code. The key difference is that RCE is tightly wedded to Google Chrome and therefor works only where Chrome is available. The CloudReader, on the other hand, runs in almost all browsers. Another distinction is while RCS loads the user’s books into a private filesystem managed by Chrome on the user’s computer, the CloudReader loads its books from a “bookshelf” located somewhere on the web. The CloudReader is downloaded each time the user creates a new instance of the CloudReader. The bookshelf and the CloudReader’s deployed location are typically the same, but do not need to be so.

The only supported platform for RCE is of course Google Chrome. It is validated (tested) on Windows (7 and 8), OSX, and ChromeOS (ChromeBook). It may work on other platforms but we do not test it elsewhere. Chrome apps are not supported on iOS or Android.

The CloudReader is currently validated against the latest version of all major browsers, including:

- Safari (OSX and iOS only),
- Firefox (iOS, OSX, Windows, Android),
- Chrome (iOS, OSX, Windows, Android).

Again, the CloudReader may (and usually does) run properly on other browser/platform combinations, but Readium does not validate against them.

## More

[Using the CloudReader to Test EPUB Publications](/technical/notes/testing-with-cloudreader/).

[View the release notes for Readium SDK and JS](releases.md).