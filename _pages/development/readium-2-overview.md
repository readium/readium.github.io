---
layout: post
title:  "Overview of Readium 2"
date:   2017-03-23 11:36:00 +0100
categories: overview
permalink: /development/readium-2-overview.html/
---

The ultimate goal of the project is to develop a framework for interpreting and rendering EPUB digital publishing markup. This framework will consist of leveraging all the capabilities of the existing browser engines and supplementing those capabilities with separate modules (polyfills, if you will) that provide additional functionality. These additional modules are intended to be, insofar as possible, independent of one or another so that they can be used independently of the overall framework. At the same time, these polyfills will be designed so that they can be easily and seamlessly combined to produce complete reading systems.

The project has started in 2016 with a report on the state of development of the Readium SDK and Readium JS, highlighting the top issues developers were facing when using the codebase. The current phase is a brainstorming on the future architecture of the Readium-2 framework, and you can follow this work on the [Readium-2](https://github.com/readium/readium-2) Github, or directly access the documentation [here](/table-of-contents-readium-2/).
