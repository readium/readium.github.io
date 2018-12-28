---
layout: page
permalink: "/about/faq.html/"
title: Readium FAQ
---
 

### General

**How can I help the Readium projects?**

There are **many** ways to help the Readium projects. You don’t have to be a developer or publishing guru.  

If you have these skills and want to help, you are of course very welcome!  But we also have great needs for testers, documentation, translators and many other areas.  If you want to help please [contact us](/contact/contact) and [visit the following page](/development/contributing/).

 

### The Readium Foundation

**What is the relationship between Readium and standards bodies such as the IDPF and W3C?**

In early 2017, IDPF  was absorbed into the World Wide Web Consortium (W3C), which is responsible for HTML and other Web Standard. Thus standards development for EPUB and other publishing technology for the Web Platform is now taking place within W3C. For more information see [Publishing@W3C](https://w3.org/publishing). 

A number of Readium Foundation members and contributors are participating in Publishing@W3C activities to help ensure coordination. 

Governance of Readium Foundation is by board of directors elected by representatives of its member organizations.



### The ReadiumJS Project

**What is the status of cross-browser support in Readium's web-based solution?**

The original ReadiumJS implementation was architected to work on any modern (HTML5) browser. The Readium Chrome Application, which  was based on that codebase, functioned only in the Google Chrome browser. However, the Readium Cloud Reader was/is a full EPUB 3 implementation that runs in Google Chrome, Firefox, Safari, Microsoft Edge and Opera on essentially all platforms supported by those browsers.  

Readium is currently working on a replacement for the ReadiumJS browser-based functionality. It is currently termed "Readium Web" (though this name may change). It should be ready for testing and deployment in the first half of 2019.  

### Readium App Development

**Are the Readium "test apps" intended to be a consumer-grade EPUB reading system?**

No, the applications developed as part of the support for various platforms are intended solely for testing and demonstration.  They are not intended as commercial applications.  Everyone is of course welcome to clone/fork the codebase(s) and develop such commercial applications, but this is not a Readium mandate.

**Can the Readium "test apps" open DRM-protected eBooks?**

Yes and no.  The iOS and Android native apps DO support [LCP](https://www.edrlab.org/readium/readium-lcp/) so they can open publications protected with that technology.  However, there is a lot of infrastructure associated with selling/lending eBooks with DRM that is out of scope for the test apps. This infrastructure is not implemented in the test apps.

On the other hand, the browser-based test apps (i.e. Readium Web and Readium Desktop) have no plans to support DRM.  In general, JavaScript apps are too easy to compromise, so using DRM in the browser doesn't make a lot of sense and Readium has no plans to implement such support.

**Will the Readium test apps support other publication formats besides EPUB?**

Yes, with a couple of caveats.  Out of the box, the Readium SDKs and utilities support EPUB (2.x - 3.x).  They also have built-in support for the WebPub manifest and have been designed to make support for other formats realtively easy.  That said, these other formats are not currently W3C recommendations so they are something of a moving target.  But the Readium design is such that supporting these new standards should be straightforward. Some prototypes have already been developed.

**Will the Readium test apps support other publication formats such as PDF?**

Not at this time. We have considered supporting PDF, but as an open-source effort we are dependent on volunteers to provide the resources for such undertaking.  At present, such an effort is not in our scope.

**Are the Readium test apps accessible?**

Yes! Basic accessibility support has been implemented.  We are continuing to work actively on improving that support.  Readium welcomes all reports of areas where we can improve our support and especially welcome any contribution to its development and testing.

**Are the Readium test apps localized to languages besides English?**

Yes and no.  It is fully intended that all the apps will provide the capability to be localized.  However, this support is not yet complete.  Readium is working hard on providing this support and, of course, testing it.

That said, one of the harder aspects of such localization efforts is the actual localization of the strings themselves.  For this, Readium greatly values the contributions from any and all.  So please help us out if you can.

**Do the test apps share source code?**

Some but it is limited to platform-independent glue code for the most part. When the current (second) generation of Readium was designed, we made an explicit decision (after much discussion) to implement the different SDKs and utilities in a platform-specific way.  This was driven by a desire to avoid all the compromises and hacks that were needed for the first generation Readium code due to its cross-platform nature.

**Can I deploy the Readium Web reader on my own site?**

Yes!  And it will be relatively easy.  However, as mentioned above, Readium Web is a work in progress.  If you wish to help, please [contact us](http://localhost:4000/contact/contact/) and join in!

### The Readium Source Code

**Do I have to obtain a commercial license to use any of the Readium source code?**

Absolutely not.  Effective January, 2018 all Readium software is **permissively licensed, completely free of charge** under the [3-part BSD license](https://github.com/readium/readium.github.io/blob/master/license.txt) and the previous fee-based license is no longer offered. 

However, adopters are encouraged to help support Readium development and maintenance by paying an _optional_ annual support fee. 

## The Readium LCP

Please see the [LCP FAQ published by EDRLab](https://www.edrlab.org/readium/readium-lcp/faq/)