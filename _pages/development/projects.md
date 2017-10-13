---
layout: page
permalink: "/development/projects.html/"
title: Readium Projects
zexcerpt: The Readium Projects primary goal is to provide rock-solid, performant building blocks and applications for EPUB3 publications.
---
BThe Readium Projects primary goal is to provide rock-solid, performant building blocks and applications for EPUB3 publications. 
We invite you to make a detour around the [history of the project](/history/) if you are curious.

New versions of the different open-source codebases are communicate on the [Release page](/releases), contributor's information is found in the [Contributing page](/contributing/), and you'll find a table of contents of the project documentation in the top navbar. 

There are currently four separate projects underway: ReadiumJS, Readium SDK, Readium LCP and Readium-2:

## ReadiumJS

The ReadiumJS project is developing a JavaScript library ([readium-js](https://github.com/readium/readium-js)) and viewer ([readium-js-viewer](https://github.com/readium/readium-js-viewer)) for EPUB 3 rendering optimized for use to render EPUB files directly from websites and in browser-based "cloud" readers. Using ReadiumJS does not require any server-side infrastructure or browser plug-ins. ReadiumJS shares common JS modules ([readium-shared-js](https://github.com/readium/readium-shared-js)) with the Readium SDK project which targets native apps.

There are two parts to ReadiumJS:

- A [Readium Chrome Extension](https://chrome.google.com/webstore/detail/readium/fepbnnnkkadjhjahcafoaglimekefifl?hl=en-US) which is available from the Chrome Web Store. It is one of the most full-featured EPUB 3 Reading Systems available.
- A cross-browser (as opposed to a Chrome Extension) implementation (known as the CloudReader) based on essentially the same sources but with a different viewer/application front end.

In addition, all of the source code for both the Chrome Extension and the CloudReader can be downloaded from github as source code and modified to suit. All of the ReadiumJS sub-projects are available under the BSD open source license.

## Readium SDK

The [Readium SDK](https://github.com/readium/readium-sdk) project is developing a compact, performant EPUB 3 rendering engine optimized for use in native apps for tablets and other devices. The Readium SDK Core C++ library is cross-platform and implemented largely in native code with some JavaScript/Java/C# implementations where appropriate. It comes along with iOS and Android testing wrappers.

Note that the Readium SDK Core C++ library is dual-licensed: publicly via [Gnu Affero General Public License Version 3](http://www.gnu.org/licenses/agpl-3.0.html) (a license which contains terms incompatible with use in closed-source software including a [copyleft](https://en.wikipedia.org/wiki/Copyleft) provision), and via an [Alternative License](http://readium.org/about-us/corporate-documents/readium-sdk-license) based on the [Apache License](http://www.apache.org/licenses/LICENSE-2.0) which provides additional rights targeted to commercial adopters utilizing Readium SDK in closed-source software, including not having any copyleft provision. For more information on Readium SDK licensing see this [link](http://readium.org/license-readium-sdk).

## Readium LCP

Several members of Readium Foundation are pursuing, as a sub-project of Readium SDK, an implementation of a  DRM technology. Readium LCP (for "Licensed Content Protection") is providing a module for Readium SDK as well as server-side components. Note that the use of Readium SDK does not require the use of Readium LCP. 

You can find the LCP Specifications, along with information about the related open-source software, in [Readium LCP Specs and codebase](/readium-lcp-specifications-codebase/).

More informations about Readium LCP on the [EDRLab website](https://edrlab.org/edrlab/readium-lcp-overview/).

## Readium-2

The ultimate goal of the project is to develop a framework for interpreting and rendering EPUB digital publishing markup.
This framework will consist of leveraging all the capabilities of the existing browser engines and supplementing those capabilities with separate modules (polyfills, if you will) that provide additional functionality.  These additional modules are intended to be, insofar as possible, independent of one or another so that they can be used independently of the overall framework.  At the same time, these polyfills will be designed so that they **can** be easily and seamlessly combined to produce complete reading systems.

The project has started in 2016 with a report on the state of development of the Readium SDK and Readium JS, highlighting the top issues developers were facing when using the codebase. The current phase is a brainstorming on the future architecture of the Readium-2 framework, and you can follow this work on the [Readium-2 Github](https://github.com/readium/readium-2). 

[history of the project](/history/)
[test](/readium-2/navigator/README.html)
