---
layout: page
permalink: "/development/website-org/"
title: Readium Website Organizaton
excerpt: .
---
     
## readium.org Website Organization
### Layout of the Pages

This document outlines the structure and operation of the readium.org website.  It details how the use of markdown documents, coupled with jekyll produces a dynamically generated website. The primary goals of this structure is to enable hosting of the website on readium's github pages, which enables implicit backups (via github itself) as well as free hosting.  Secondly, by using markdown in a clear strucuture, it makes it easy for any contributor to edit the files that make up the content of the website.  No coding in HTML, no fiddling with CSS or PHP, just a clear structure and a series of content files written in markdown.

The basic principle of [Jekyll](https://jekyllrb.com/) is that the **content**is written in plain text (tyically markdown) which is then transformed through one or more templates (layouts) and HTML/CSS is generated.  It is that generated code that is then served via the website.

In many Jekyll-driven websites, there is a single folder named _posts where a series of dated markdown documents are placed.  These are then fetched by the Jekyll engine and displayed as set of blog pages.  

The use of Jekyll in readium.org is a little different. Almost all the files have the form depicted in this diagram of the About/FAQ page:

![home-page](/assets/images/Jekyll-Layout.jpg)

The content is in the file FAQ.md, written as markdown (actually Kramdown, dialect of markdown supported by Jekyll).  That file specifies in its "frontmatter" that is to be laid out in the layout-template named `page.html`.

In turn, `page.html` has two sections:

- the "breadcrumbs" section which enables the breadcrumb-style navigation
- the main container which provides some basic styling and a `content` include directive where the transformed markdown will be placed.

`page.html` in turn, indicates in its frontmatter that it should be placed into the default.html layout template.

`default.html` has four include directives:

- the `head` directive, where the normal HTML include files (CSS, etc.) are placed, from the include file head.html
- the `header` directive, where the header section of HTML which is common to all the files in readium.org is to be inserted
- the `content` directive section, where the contents of the generated page.html will be inserted
- the `footer` directive, where the footer section of HTML which is common to all the pages in the readium.org site are inserted.

The readium.org home page is a little different. It has the same head, header and footer as the other pages, but it also has two content sections. It looks like this:

![home-page](/assets/images/Jekyll-Layout-Home.jpg)

The first is a blob of straight HTML which displays the banner image overlaid with the "mission statement" of the Readium Foundation as well as two buttons, one of which takes users to the Chrome application download page and another which takes the user to the "Contributing" page on the website.

The other section is a simple for-loop which fetches the four most recent news items from the folder `_pages/news/_posts`.

### Folder Structure of the Site

The basic folder struture of the site is

![site-folders](/assets/images/site-folders.jpg)

The key elements are:

- `config.yml`:  which is the config file for the Jekyll site
- `_includes`:  which are the various cross-site include files, such as header.html which comprises the all the menus
- `_layouts`: which has all the Jekyll templates
- _pages: which has a folder for each main menu-item and each folder has the markdown that comprises the actual page content
- `_site`: which holds all the generated content for the whole site from which the website is served
 
