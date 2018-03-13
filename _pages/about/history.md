---
layout: page
permalink: "/about/history.html/"
title: A Bit of History
---
The Readium project was started by the IDPF in 2012 because the EPUB 3.0 specification had been released late in 2011, but no implementation yet existed (or, at least, had been publicly released). So IDPF provided some funding and encouragement and two firms, Evident Point and Bluefire, took the lead in developing a JavaScript implementation of a significant part of the EPUB 3 spec.

However, while this was a real step in the right direction, it was not a complete implementation and it was written as a Google Chrome extension. This was fine as a demo, but did not provide an implementation for native devices (iOS and Android as well as desktops) and since it was in JavaScript, it couldn’t support DRM securely. Therefore the IDPF began seeking out other companies and individuals who, in addition to Bluefire and Evident Point, could help create a native implementation.

One of these companies was Kobo, of Toronto, Ontario. Kobo had several eReaders but had wanted to consolidate the work and generate one, stable, maintainable codebase. So they asked one of the senior engineers, Jim Dovey to write and/or consolidate the available code into one. Then when IDPF came around asking for contributions, Kobo decided to let the C++ library developed by Jim be released into Open Source as the Readium SDK core.

However, the SDK core was just that, a core on which to build apps so Readium needed to do that. At the same time, it was realized that the Chrome Extension provided much of a “web-app” framework - in JavaScript - so the decision was made to undertake two subprojects:

- Revamp the existing JS code base, factoring it into 3 parts:
    - The low-level parsing and support, equivalent to the SDK,
    - A browser-management and utility layer,
    - The actual Chrome Extension application layer,
- Create actual apps based on the SDK which would comprise:
    - The actual SDK core,
    - The same browser-management and utility layer as in the Chrome Extension,
    - Four native code application layers (iOS, Android, OSX and Windows)
  
All of the above was (largely) done in 2013. The native applications (termed ‘Launchers’) were deliberately kept very crude and limited in order to not compete with Readium Foundation members who were building polished EPUB readers for themselves and clients. At the same time, the Chrome Extension was re-factored a bit to produce a cross-browser application (now called the CloudReader) in addition to the Chrome Extension. Note that Google subsequently changed the requirements for Chrome Extensions, so the "Extension" was refactored to be a Chrome Application instead.  Today, Google is deprecating that framework so Readium is developing a replacement which will hopefully be deployed in 2018.

It’s worth noting that the Windows Launcher was never really developed, primarily due to a lack of interest by both developers and Readium Foundation members.

The SDK was designed from the beginning to support DRM ( Digital Rights Management ), a mandatory feature for digital library lending, and also required by many publisher for anti-piracy matters. It was moreover designed to be DRM-agnostic, able to support multiple DRM implementations. However, while that capability existed in the SDK, there was also an increasing perception over time that the existing DRM implementations (Adobe, Kobo, Sony) were too heavyweight and proprietary and there existed a need for a new open-source DRM specification and implementation. The result was the Readium LCP (Licensed Content Protection) specification and implementation, which is rolling out in 2017.
