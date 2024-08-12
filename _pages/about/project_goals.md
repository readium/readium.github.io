---
layout: page
permalink: "/about/project_goals.html/"
title: Readium Project Goals
---

The fundamental goal of the Readium project is to produce a set of robust, performant, spec-compliant reading system toolkits that support digital publishing formats and can be deployed in browsers or built into mobile or desktop reading applications.  

### Primary Focus

The project’s primary focus is to provide a set of software building blocks, i.e. software development kits as well as utilies that faciliates the construction of a wide spectrum of robust, performant reading systems.  

It is the intent to enable a platform that can be easily adapted to supporting a variety of "digial publishing formats", including:

- EPUB 2 and 3
- Audiobooks
- Digital Visual Narrativess (Comics, Manga, Webtoons etc.)
- Web Publications
- PDF, to a certain extent. 

Note: PDF publications do not benefit from advanced features developed for EPUB and Web Publications (annotations, search, text-to-speech). Readium is focusing on EPUB and Web Publications, and lets other software developers propose advanced PDF tools.

Readium has four target platforms:

- iOS using Swift
- Android using Kotlin
- Desktop (MacOS, Windows, Linux) using Typescript, Node.js and Electron.js
- The Web platform using Typescript and Golang. 

Developers are of course more than welcome to adapt the Readium toolkits to other platforms and languages.

Readium strives to network and coordinate with other open-source efforts, most notably the European Digital Reading Lab ([EDRLab](https://www.edrlab.org/)). EDRLab is not only a major participant in the Readium effort, but is also the lead and driver for the [Licensed Content Protection (LCP)](https://www.edrlab.org/readium/readium-lcp/) system.

### Open Source

Readium is a true open-source project, permissively licensed under the 3-part BSD license.  This licensing approach applies to ALL software developed in the Readium project. This includes not only the current active projects but also legacy software (Cloud Reader, Chrome app and Readium C++ SDK)

### Communication

Readium strives to create a courteous, welcoming environment that feels approachable to newcomers. We maintain discussion threads on our Github projects, where the developer ideas are heard and discussed with equal weight. We respond to Github issues as quickly as possible. Readium Foundation members and active contributors to the toolkits benefit from a Slack space where they can directly discuss with the project maintainers. 

For more information see the [Contribution page](https://readium.org/development/contributing/).

### Standards Compliance

Publishing standards are expected to have longevity, to be interoperable across multiple, indirect distribution channels, and reliably manipulated by intermediate workflows. 

Readium aims for being a comprehensive reference system, with a high level of compliance with EPUB 3 as well as other emerging digital publishing formats, such as Web Publications, Audiobooks and Digital Visual Narratives.

In order to achieve this, many members of the Readium community are active participants in a wide variety of W3C working groups (e.g. working, community and business groups for both EPUB and Web Publications).  

### Accessibility

Providing access to reading system functionality for ALL users is a critical part of Readium goals.  To achieve this, great efforts are made as part of the Readium development to provide access to the content for all users, whether that is through using CSS to provide a better reading experience or tight integration with system level accessibility affordances such as VoiceOver and similar technologies.

### Stability

The Readium development community strives to keep the code base up to date and with a high degree of stability. This means that crashes, hangs and regressions are given the highest priority for fixes and releases.  Readium closely tracks reported issues from both internal testing and external forums.  Members of the Readium community are strongly encouraged to report new issues, update ongoing problems and foster communication aimed at provide a more stable development and execution environment.

### Performance

Maintaining and improving execution speed and memory use is an important goal, and one that Readium aims to achieve.  However, there is a dynamic balance to be struck as Readium also aims to provide a complete reference system for both EPUB and other emerging publishing standards.

### Security

Protecting users from security violations is critical. Insofar as possible we strive to fix security issues promptly to protect users and maintain their trust.

### Usability

To the extent that Readium features affect the user experience, we want them to work in accordance with good human interface design principles, and to mesh well with platform-native UI conventions. Furthermore, we strive to integrate with platform accessibility features to allow access for all users, including those with disabilities.

### Governance

The governance of the project is achieved by a seven-person board of directors, which takes direction from the members of the Readium Foundation.

### Non-Goals

The above set of goals are a lot to bite off, so we consider the following out of scope for the project:

- Readium is a reference system and engine, not a commercial Reading System. Thus there is no guaranteed support for software developers using the toolkits. 
- We have no plans to develop or host a full-featured commercial-quality application based on Readium. Others are welcome to do so, of course.


 
