---
layout: post
title:  Update Your Readium!
excerpt: We have learned that some of our Readium users are not updating Readium  when new releases are made.  This is unfortunate as we typically have some real bug fixes in each release.
date:   2019-03-18 11:30:00 +0100
categories: news
permalink: /news/_posts/update-your-readium/
---

We know that some of our users do not update their copy (cloned or forked) of Readium when new releases of Readium are made.  Specifically, new releases of "Readium 1" (ReadiumJS and Readium SDK) almost always contain one or more significant fixes or enhancements.

For example. a bug was found almost 2 years ago that could cause incorrect rendering if there was a collision between Readium's CSS classes and the user's own CSS classes.  In this case, the result would be that the resulting rendering would be half-opacity (i.e. opacity == 0.5).  The fix was in Release 0.22 (!!) in 2016.  The fix is [here](https://github.com/readium/readium-js-viewer/commit/7b02bb819ce7240a1d627b8eef9ad95084557e6d#diff-52d27ebf03fec76d86710df3e46781c4).  A sample file is [here](https://www.dropbox.com/s/moz7dk13kuiscxq/test-comment-class.epub?dl=0).

Please, everyone, we know that dev and QE time is precious but it would help everyone if every effort was made to keep up with our releases. For more information or help, please contact [Ric Wright](mailto:rkwright@geofx.com). 