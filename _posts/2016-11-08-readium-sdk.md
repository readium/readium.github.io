---
layout: post
title:  "Overview of Readium SDK"
date:   2016-12-28 11:30:00 +0100
categories: overview
permalink: /readiumsdk/
---

Readium SDK consists of three major parts:

- readium-sdk
- Readium-shared-js
- SDKLauncher-*
The diagram below illustrates the high-level relationship of the parts of the architecture.

![readium-sdk](/assets/images/readium-sdk.png)

### readium-sdk

This is is the Core C++ code that manages the EPUB package, metadata, navigating and fetching resources and so on. The Core is platform-independent. In addition to the C++ core, there are also platform-dependent code layers that provide the interfaces to the platform-specific language layers:

- iOS and OSX: There is no interface layer since Objective-C can call C++ directly. However, there is an interface layer (in Objective-C) called RDServices
Android: This is the Java/C JNI layer.
- Windows:
    - MFC: There is no interface layer as MFC can call the C++ core directly
    - RT: As Windows RT framework-based code is managed code, there is a C#/C++ layer

### readium-shared-js

This layer, as its name implies, is pure JavaScript. It provides the interfaces and services between the application layer (in Objective-C, C++, Java or C#) and the Core as well as the web-browser engine instance. This layer is shared across all platforms and sub-projects, including both ReadiumJS sub-projects and all SDK-based applications. It manages messaging between the native layers as well as providing the management of views and other facilities of the browser engine.

### SDKLauncher-*

These are platform-specific applications that facilitate testing of the rest of the SDK as well as providing a rudimentary demonstration of how to integrate native applications with the SDK. They are deliberately rather limited and crude since it is not the intent of Readium to compete with its own members, many of whose value proposition is integrating the SDK into their sophisticated applications and workflows.

The platforms supported by Readium SDK (as of summer 2015) are

- iOS 7 and above
- Android 4.x and above
- OSX 10.7 and above
- Windows 7 and 8
    - MFC framework
- Windows 8 and 10
    - RT framework

Of course, developers are welcome to tackle porting to and integration with other platforms, but the above are the only platforms against which the Readium SDK is validated and for which Launchers exist.
