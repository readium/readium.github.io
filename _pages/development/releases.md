---
layout: page
title:  "Releases"
date:   2016-11-08 15:30:00 +0100
categories: releases
permalink: "/development/releases/"
---

## Current Plan for the Next Release
### Readium 0.30

This release is targeted for February 2018.

The primary features will be:

- Update the SDK Licenses to be BSD 3-clause
- Fix for the event handling in continuous scroll mode that interferes with proper functioning of the Hypothes.is plugin
- Some additional fixes for the Hypothes.is support
- Fixes for some media-overlay bugs on Android
- Other features or bug fixes as feasible in the targeted time frame

## Recent Releases

### Readium 0.29
The Readium development community is pleased to announce the release of 0.29. This release was pushed to master and the Chrome store on 22 December 2017.
This release is primarily some minor updates:
Additional fixes and improvements to the Hypothes.is support in the Readium CloudReader
Updating the Android support in the SDK to the latest releases for Android tooling and the NDK
A number of minor bug fixes across the various modules (please see detailed release notes here)
The tag for this release is 0.29 on GitHub. 

#### Improvements and Enhancements in this Release

##### SDK
Android tools and libraries (NDK) have been upgraded to the latest.

##### Shared Libraries *(readium-shared-js and readium-cfi-js)*
A number of improvements to navigation and layout.

##### Chrome App
This release, 2.29.0, includes no new user-visible features, but does include a large number of bug fixes related to navigation and page layout.  These result in improved navigation and performance.

##### Readium Cloud Reader
The Readium CloudReader has now been enhanced to provide support for the Hypothes.is annotation and bookmarking client/server infrastructure.  This release provides a number of minor bug fixes and enhancements to that support.

 Note that the Hypothes.is support is ONLY available in the CloudReader version of ReadiumJS.  It is NOT available in the Readium Chrome app.  We regret this, but it is simply not feasible to implement that functionality within the Google Chrome app framework

The complete release notes are [here](https://docs.google.com/document/d/1b7j2Fjgpv-2uVQ5xVD2a62RCNHYJ11wrN6_lPzzVPa4/edit#heading=h.qtxpy4mgkpwz).

### Readium 0.28

This release is targeted for early fall 2017.

Candidate features include:

- Merge many of the pending Pull Requests
- More bug fixes (exact ones TBD)
- Other features still TBD

### Readium 0.27

Readium.org is pleased to announce that 0.27 version of Readium has been released.  This release was pushed 12 June 2017.

This release of Readium SDK and ReadiumJS (Chrome Extension and Cloud Reader) is primarily a bug fix release..

The tag for this release is 0.27 on GitHub. 

#### Improvements and Enhancements in this Release
##### Readium SDK
The only real change to the SDK in this release are some minor updates to the gradle build configuration.

##### Cloud Reader/Chrome App
There are two bug fixes in this release.  The first, and most important, is to fix a regression bug in the handling of CFIs, particularly with respect to using CFIs with the table-of-contents in the CloudReader and the Chrome app.  This bug resulted in inconsistent behaviour where clicking on  a TOC entry would not go to the same (correct) location in the document.  Instead, the destination would vary erratically.  This is now fixed.
The second bug  occurred when some SVG was embedded in a reflowable document.  In this case, the page-load spinner would be started on page load but would never stop.  This is now fixed.
The version of the MathJax library was bumped up to 2.7.1, which was primarily a build configuration upgrade.
There were also a number of minor changes to build infrastructure (support for Yarn and Chai, etc.)

### Readium 0.26

Readium.org is pleased to announce that 0.26 version of Readium has been released.  This release was pushed 3 May 2017.

This release of Readium SDK and ReadiumJS (Chrome Extension and Cloud Reader) is a relatively significant release for the SDK as it comprises all the changes and improvements needed to integrate multiple DRM schemes, including Readium LCP.

The tag for this release is 0.26 on GitHub. 

#### Improvements and Enhancements in this Release
##### Readium SDK
The primary change in the SDK is addition of support for Readium LCP and other DRM schemes. For more information about LCP, please see the FAQ here.  To be clear, this release does not include the release of LCP itself but comprises the changes made to the SDK to enable app developers to integrate one or more DRMs, such as LCP or Sony’s URMS with applications based on Readium. These changes are primarily in the ContentModule and ContentFilter architecture. For developers not using those facilities the impact of these changes should be small or non-existent.
However, as part of these changes there were also non-trivial changes to the Gradle-based build processes for Android. This includes a requirement to be using Android Studio (as Eclipse is officially deprecated by Google). Developers should be using the latest build of Android Studio, which is 2.3.1 at the time of this release. This release is also compatible with the “experimental Gradle plugin” which enables debugging into C++ in addition to Java.
##### Cloud Reader/Chrome App
There are no new features in the Chrome App or the Cloud Reader. However, the release of Google Chrome v. 57 on March 9 “fixed” a previous security hole in its browser extensions framework. The result is that nline-script (JavaScript embedded in an EPUB page) will no longer function in the Readium Chrome app, due to tighter Content Security Policy checks. Instead, an exception is thrown when an inline script attempts to execute. It is still possible to write scripts that will work in the EPUBs, but they have to be written in a specific way compatible with Chrome extensions’ CSP.
For more information about the security protocol and how to write compliant JavaScript interactivity, see this article. An extensive discussion of the issue in the readium-js-viewer repository can be found here. The issue includes links to both invalid and valid EPUBs. For more information, please contact Ric Wright directly.
Note!  This security protocol does NOT affect the CloudReader, only the Chrome app. The CloudReader execution of inline JavaScript is not affected.


### Readium 0.25

Readium.org is pleased to announce that 0.25 version of Readium has been released.  This release was pushed 2 February 2017.

This release, 0.25, has one significant feature in the Chrome Extensions and number of minor improvements in both the Chrome App and the Cloud Reader - as well as a large number of bug fixes.

In the SDK, thep primary change in the SDK is addition of support for XCode 8. We also exposed more metadata via the JNI layer in the Java. Finally, we eliminated a potential security hole related to XML Entity declarations.

The new feature in the Chrome Extension is the capability and UI to allow users to change the font-face for a given document.  In particular the OpenDyslexic font is now an option as well as a sans-serif font and a serif font.  There is no capability for users to add new fonts. The CloudReader has the same feature to allow users to change fonts, plus a few more available (web) fonts.

In addition, there were a fair number of bug fixes.

The complete release notes can be found [here](https://docs.google.com/document/d/1OBBCrjWNOrhFmZRN9z37sd2_SXV_n6NVARLf43-MroM/edit#heading=h.qtxpy4mgkpwz).

### Readium 0.24

Readium.org is pleased to announce that 0.24 version of Readium has been released.  This release was pushed 16 August 2016.

This release, 0.24, is a new release that has one significant feature in the Chrome Extensions and number of minor improvements in both the Chrome Extension and Cloud Reader - as well as a large number of bug fixes.

In the SDK, there were a number of minor bug fixes, plus the removal of some obsolete libraries (OpenSSL for Android and Boos).

The new feature in the Chrome Extension (which is NOT in the Cloud Reader) is the support for importing more than one file at a time. Multiple files can be added via drag and drop onto the library pane or via the normal “Add File” dialog. Once the import has started, the user CAN cancel the import process but the file being imported when the cancel button is pressed will still be imported but subsequent queued files will not be imported.

In addition, there were two regressions in the previous releases:

- An experimental highlighting plugin was inadvertently included in the previous 2.23 build. While this is a nice feature, it is not yet complete - there’s no way to save the highlights. We are working on this but have no ETA when it will be available (volunteers are welcome).
- Navigation using the TOC was not working correctly for TOC items that were not top level (i.e. sub-headers). This is now fixed in this release.

The complete release notes can be found [here](https://docs.google.com/document/d/1ioOVtGK00m8TUtGfKA8DCq428wXREfmexc0_fuyHTUs/edit#).

### Readium - 0.23

Readium.org is pleased to announce that 0.23 version of Readium has been released.  This release was pushed 10 June 2016.

This release, 0.23, is a new release that is has one major change and a number of minor improvements - as well as a large number of bug fixes, primarily affecting CFI/navigation. The major change is that we have switched Android build support from Eclipse (now deprecated) to Android Studio (currently 2.1). We also enabled (experimental) support for debugging from Java into C++ (see release notes for more info). Also, HTTP header caching has been enabled which can provide significant performance improvements for some resource-heavy EPUBs.

There are also some minor UX improvements to the Chrome Extensions. Finally, a subset of OPDS support was added to the CloudReader (it was experimental before). You can see a demonstration of it [here](https://readium-master.surge.sh/).

The complete release notes can be found [here](https://docs.google.com/document/d/1vOHtIyppPHuLwIW9Ip2Kl4Y87GmnHvEWCWOS0lg6Vy4/edit#).

### Readium - 0.22

Readium.org is pleased to announce that 0.22 version of Readium has been released.  This release was pushed 2 February 2016.

This release, 0.22, is a new release that is comprised primarily of improvements and bug fixes to shared-js and the CFI library. It also includes an update to Mathjax 2.6.

The complete release notes can be found [here](https://docs.google.com/document/d/1LcMjSpZR1ho5N2wo9R2O1FxXsFUScUPWVLjLmvrPrL4/edit#).

### Readium - 0.21

Readium.org is pleased to announce that 0.21 version of Readium has been released.  This release was pushed 2 September 2015.

This release, 0.21, is a new release that is comprised primarily of bug fixes.

The complete release notes can be found [here](https://docs.google.com/document/d/1V5LtEtpMvOLCZCRf60PMH1cyDBVTPRsDTd7Iz0NBb9Y/edit#).

### Readium - 0.20

Readium.org is pleased to announce that 0.19 version of Readium has been released.  This release was pushed 18 June 2015.

This release, 0.20, is a new release that is comprised primarily of improvements and bug fixes.

The complete release notes can be found [here](https://docs.google.com/document/d/1Io3CDScwm5tj_0tRa4qSm_bGXi3bUb_uoiHXoxTktAQ/edit#heading=h.ybo2phzex0y2).

### Readium - 0.19

Readium.org is pleased to announce that 0.19 version of Readium has been released.  This release was pushed 18 June 2015.

This release, 0.19, is a new release that is comprised primarily of improvements and bug fixes to the ContentFilter support, especially for encrypted resources.

The complete release notes can be found [here](https://docs.google.com/document/d/13NJJPDd_Q_tFVVvFYFdDIUHJlEZY0gZ8C3WtPmdV5Eo/edit#).

### Readium - 0.18

Readium.org is pleased to announce that 0.18 version of Readium has been released.  This release was pushed 21 April 2015.

This release, 0.18, is a new release that is comprised primarily of bug fixes for the Chrome Extension. Significantly, though, it adds support for Chrome Extension Packaging 2.0.  The primary aspect of this new packaging format that users will see right now is the the Reader will have its own window and icon in the taskbar when running (all platforms).

The complete release notes can be found [here](https://docs.google.com/document/d/1GUdWAJ7_Zgg2eXgDK-4ty4e4_pCJ2fHC7S5jKjJhz7w/edit#heading=h.ybo2phzex0y2).

### Readium - 0.17

Readium.org is pleased to announce that 0.17 version of the Readium SDK has been released.  This release was pushed 23 March 2015.

This release includes a significant fix for media handling under Android, which fixes a number of serious stability issues. This release comprises updates to the readium github repositories for readium-sdk, readium-shared-js and the SDK sample applications (including configurations for Android, iOS, and OS/X that have been validated against the EPUB Test Suite, and a Windows configuration that is still in development).  This marks the 17th push (formally tagged as version 0.17) of the source code for SDK.  This release has achieved substantially complete support for the EPUB 3.0 spec including MathML, Reading System object, font-deobfuscation and many more features. The complete release notes can be found [here](https://docs.google.com/document/d/1poM6j7rbO1P-hdGczsK-2lIJPSVGBZmFoL5g_qXvARA/edit#h).

### Readium - 0.16

Readium.org is pleased to announce that the “1.0” version of the Readium SDK has been released. With this release, the first version of the Readium SDK is essentially complete (hence the “1.0” label). This release was pushed 30 December 2014.

The 1.0 version comprises updates to the readium github repositories for readium-sdk, readium-shared-js and the SDK sample applications (including configurations for Android, iOS, and OS/X that have been validated against the EPUB Test Suite, and a Windows configuration that is still in development).  1.0 marks the 16th push (formally tagged as version 0.16.1) of the source code for SDK.  This release has achieved substantially complete support for the EPUB 3.0 spec including MathML, Reading System object, font-deobfuscation and many more features.  The complete release notes can be found [here](https://docs.google.com/document/d/1AW2Ja9HArF8f9YJCiTSdkMuqZvQgP7oVplA3DJ-ssTY/edit#heading=h.lqh1c9gooqsh).

### Older Releases

The release notes for older releases can be found in Readium's GoogleDoc archives [here](https://drive.google.com/drive/folders/0BzaNaBNAB6FjbloySkdKRHZzdGM/0BzaNaBNAB6FjTE1PVkhWcTM0cU0/0BzaNaBNAB6FjMllWSjQwa2lwVkU?hl=en).