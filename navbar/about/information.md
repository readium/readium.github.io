---
layout: page-with-ads
navtitle: About/Readium Project Information
title: Readium Project Information
permalink: /information/
---
The Readium Projects primary goal is to provide rock-solid, performant building blocks and applications for EPUB3 publications.

### ReadiumJS

The ReadiumJS project is developing a JavaScript library ([readium-js](https://github.com/readium/readium-js)) and viewer ([readium-js-viewer](https://github.com/readium/readium-js-viewer)) for EPUB 3 rendering optimized for use to render EPUB files directly from websites and in browser-based "cloud" readers. Using ReadiumJS does not require any server-side infrastructure or browser plug-ins. ReadiumJS shares common JS modules ([readium-shared-js](https://github.com/readium/readium-shared-js)) with the Readium SDK project which targets native apps.

There are two parts to ReadiumJS:

- A [Readium Chrome Extension](https://chrome.google.com/webstore/detail/readium/fepbnnnkkadjhjahcafoaglimekefifl?hl=en-US) which is available from the Chrome Web Store. It is one of the most full-featured EPUB 3 Reading Systems available.

- A cross-browser implementation known as the CloudReader.

### Readium SDK

The [Readium SDK](https://github.com/readium/readium-js-viewer) project is developing a compact, performant EPUB 3 rendering engine optimized for use in native apps for tablets and other devices. The Readium SDK Core C++ library with platform wrappers implementations where appropriate.

THe SDK is available for both open-source and commercial use. Details of the licensing is available [here](http://readium.org/license-readium-sdk).

### Readium LCP

The Readium Foundation is developing a DRM library, Licensed Content Protection (LCP) which can be used with the Readium SDK to build DRM-enabled clients as well as server-side components. Readium SDK will not require use of Readium LCP, which will be separately licensed to interested parties. 