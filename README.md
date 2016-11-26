# readium.github.io
Base repository for Readium project details, accessible online as a [Readium Projects section](http://readium.github.io)

*All additions or corrections MUST be done via Pull Requests and validated by the Readium core team.* 

Note: The [Readium.org](http://readium.org) website offers primary information and news about Readium.

This documentation is using jekyll as a templating engine, therefore all posts are written in markdown and use the readium.org style, which has been reporduced locally. 

This navbar is not exactly the same as the readium.org navbar, as it only presents a link to the Table of Contents and a simplified About menu (which sends back to the readium.org website). The Readium logo also sends back to the readium.org homepage, idem for the Home entry in the breadcrumbs. 

The root directory contains only the home page and the table of contents. New articles will be posted in the `_posts`directory, with a jekyll imposed format (yyyy-mm-dd-name.md).

Each post must contain a header like 

```
---
layout: post
title:  "A Bit Of History"
date:   2016-11-15 10:30:00 +0100
categories: history
permalink: /history/
---
```

The layout parameter must be `post`(it triggers the proper template in `_layouts`), the title will appear as h1 in the post, the date also appear in the post and will be used to sort latest posts, the category is free, but may be used to group posts later, the permalink is useful.

CSS tuning has been done in the css/styles.css stylesheet. Especially, the `b` element is used for MUST, SHOULD etc. expressionsetc in  (LCP) specification pages. So be careful if you want to enhance style ...

 
