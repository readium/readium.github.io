---
layout: page
permalink: "/development/contributing/"
title:  "Contributing"
categories: contributing
---
<style>
table, td, th {
        border: 1px solid black; padding:10px;
        }
</style>

## Introduction

As an open-source project, Readium welcomes contributions from everyone - individuals, corporations and non-profit organizations. The best way to get started with Readium is to read through the introductory materials on this site, subscribe to the Readium Slack and of course download the source code and start playing.

An important note to bear in mind is that YOU are the Readium team. The Readium Foundation has no "dedicated team" and every piece of the different Readium projects is done by Readium contributors. Contributors have therefore an important role in the organization.

Many developers take Readium toolkits and integrate them into their application without contributing back to the Readium project. This is already really useful, as the increase of the number of applications based on Readium toolkits mechanically improves the level of interoperability of EPUB 3 and Audiobooks reading systems. Non-contributing developers are considered "implementers" by the active Readium community and also have a role, plus some duties, detailed below. 

## The Roles and duties of Participants

### Implementer

#### __On Readium Mobile__

If you decide to start a development based on Readium Mobile, please:

* Make sure that the whole dev team has a good understanding of Swift and Kotlin development, including build systems, dependency management etc., i.e basics that are not part of Readium Mobile. The Readium community cannot help beginners in mobile development. 
* Before expecting help in solving your implementation issues, check the codebase of the TestApp provided with the Swift and Kotlin toolkit: the TestApp does work and has all the details you need.
* If you have problems with the TestApp you just built, download the pre-compiled beta R2 Reader testapp (links are found in the readme of the Swift and Kotlin toolkits).  
* Once you have the TestApp running (and working with LCP in test mode if you are using it), this will hopefully leave only very specific questions to ask.
* If you have specific questions about the Swift or Kotlin toolkit, and the answer is not found in the codebase, Github discussions, Slack history, please ask those questions in the #r2-swift or #r2-kotlin Slack channel respectively.  
* If after careful testing you think you have discovered an issue related to the Swift or Kotlin toolkit, please open a Github issue in the swift-toolkit or kotlin-toolkit repository respectively.
* If the community cannot answer to your questions or help solving your problems, paid consulting has to be considered.
  
#### __On Readium Desktop__

If you decide to start a development based on Readium Desktop (or EDRLab's Thorium Reader), please:

* Make sure that the whole dev team has a very good understanding of Electron.js, React.js and typescript, including build systems, dependency management etc. This project is not for faint hearts ;-).
* Other rules are the same as for the Readium Mobile toolkit; the best Slack channel for discussions is #r2-desktop and issues are to be open in the appropriate r2-*-js Github repository. Only application-level issues can be open in the EDRLab thorium-reader Github repository. 

#### __On Readium LCP__

* Make sure that the whole dev team has a very good understanding of security on the Web (setting up https, securing confidential information etc.).
* Once you have obtained the test LCP client library from EDRLab, the instructions available in the toolkit should be enough to integrate the library without hiccup. 
* A first-level support is offered by EDRLab for LCP integrations.
* If you have specific questions about the LCP DRM, please ask those questions in the #lcp Slack channel.
* If the community cannot answer to your questions or help solving your problems, paid consulting has to be considered.
 
#### __Once the app is ready__

* Please announce this achievement in the Readium Slack, #general channel, with links to the apps on the Apple and Google stores. We will then add your app to the "awesome Readium" page.
* The Readium community will appreciate if you promote Readium on social networks. 
* It is still time to become a Contributor, see below ...

### Contributor

*  Contribution can be done in a variety of ways: submitting or reviewing pull requests, participating in the Readium Dev calls and in architectural discussions, writing technical documentation, etc.
* Anyone is welcome to contribute to Readium projects.
* No special rights are required, anyone can submit a pull request from a private fork or open issues to question the API or architecture.

### Maintainer

* Maintainers are contributors with write access on Readium repositories.
* They are tasked with:
  * Reviewing and merging the contributed pull requests, in a timely manner.
  * Leading on architecture, design and tooling decisions.
There should be at least two maintainers per repository, if possible.
  * To avoid stalling progress in case of absence, or being too dependent on a given person.
  * There's no such thing as a lead maintainer, decisions are collaborative and documented.
* Since the work of maintainers is usually more impacting, it can reside in branches directly in the official repositories. This will foster a quick feedback loop from other contributors.

### Release Manager

* There is only one release manager per repository.
* The release manager is tasked with versioning and distributing the releases of Readium Mobile SDK, which includes:
  * Testing the current state of develop for distribution (e.g. it must work properly with package managers).
  * Merging the develop branch into master, and tagging the version.
* Even though the release manager has the acting role, the versioning process is done collaboratively:
  1. The release manager opens a Release issue on GitHub with the current state and changelog.
  1. Contributors can review the issue and ask questions or suggest modifications in the changelog.
  1. Upon validation, the release manager can proceed and release a new version.
  1. A post on the Readium Website is then used to broadcast the new version with its changelog and important migration information.

## Grant of Copyright License

Contributors grant to the Readium Foundation and to recipients of software distributed by the Foundation a perpetual, worldwide, non-exclusive, nocharge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense and distribute their contributions and such derivative works.

Before contributing, please sign and send to the Readium Foundation the [Readium Individual Contributor License Agreement (ICLA)](/documents/Individual Contributor License Agreement.pdf).

## Contributions 

### How to Contribute

* Contributing to Readium is best done following these steps:
  1. Open an issue on the relevant repositories to state a problem you want to fix.
     1. This will avoid getting a pull request rejected because it doesn't fit the design goals.
     1. It will help gather opinions and information from other contributors.
     1. Best practices on using Git will be detailed asap. 
  1. (Optionally) Bring the subject in the Readium Dev calls for further discussion, if there's matter for debate.
  1. Create a fix in a private fork, based on the develop branch.
  1. Submit a pull request for review on the repository.
* Nobody (including maintainers) has a grant to push/merge significant commits on develop and master without peer-review first, through a pull request.
  * Exception is made for minor contributions, such as fixing typos, cleaning files or an obvious bug fix.

### Review of Pull Requests

* Before being merged, all pull requests (including the ones from maintainers) must:
  * Be reviewed by at least one contributor from a different company than the author.
  * Be opened for review for at least 2 weeks (a very interested contributor can request postponing a review if (s)he’s not available in the review window).
  * (For significant ones) Be mentioned during a weekly Readium Dev call.
* By default, the responsibility of reviewing pull requests falls back on maintainers.
  * They should at least respond quickly to show that external contribution is valued by our community.
* Anybody willing to review a pull request (including maintainers) must start a review following GitHub’s instructions. If the review can’t be done in the first 2 weeks after the pull request was opened, then the reviewer must notify the author that the review needs to be postponed with a comment on the PR.
* If nobody was willing to review a maintainer's pull request after the review window, then it can be merged.
* Upon merge and if relevant, an entry in the next change log must be added with a link to the pull request and, if necessary, migration information for reading apps.

### Coding Style

* To avoid heated debates about coding style in PRs, contributors must follow a style guide agreed upon beforehand. Selecting the style guide is done collaboratively, privileging best practices and most established standards for each platform.
* Automated linters are used to enforce coding style.
* Not observing the style guide is a valid reason to reject a pull request.

### Architectural Decisions

* Because of their deeply impacting nature, each architectural and API decision must be first discussed and agreed upon through an issue on either architecture, or in the appropriate repository for platform-specific concerns.
  * Readium Dev calls and Slack are not the place to take architectural decisions, but they can be used for debate or suggesting ideas.
* Upon agreement, a Markdown documentation will be produced to explain the architecture or API, and the solution will be implemented. This document will usually be stored into the Architecture repository on Github. 

### In Case of Disagreement

* In such a collaborative project, disagreement is bound to occur. If it can't be solved through informal discussion, then we follow this process:
  1. An issue is opened on the appropriate repository.
  1. Each side is given the opportunity to write a synthesized solution to the problem, or a counter-argument.
  1. We should avoid debating or going back and forth in longer discussions. Readium Dev calls or Slack can be used for that.
  1. Each possibility will be summarized by each debater – with a link to the detailed comments – in the first comment, and tagged with a GitHub emoticon (only the emotionally neutral ones, so Hooray, Heart and Rocket).
  1. Other contributors will be asked to vote for a given solution using the matching emoticon.
  1. During one of the following Readium Dev call, a decision will be taken according to the votes, and then documented in the issue.

## Usage of GitHub

### Branches

* `master` is used for stable, versioned releases.
* `develop` contains the in-progress work and recently merged pull requests.
  * Contributors are encouraged to have a debug build using develop branches to give quick feedback on new features and API changes, before it becomes fixed in master.

### Issues

* Because we use them for communication and decision, we need to pay attention to the quality of GitHub issues.
  * New issues must be reviewed frequently, and appropriately answered to, sorted, tagged and attributed by the maintainers.
    * Answering is free for all, the rest is done by maintainers.
* Issues must be self-descriptive and understandable by other contributors, they are not personal todo lists.

## Project Communication

Github issues are the prime medium for communicating about the evolution of the codebase. 

### Slack

Readium developers are using Slack for real-time chats.

Plase [ask an invite](http://readium-slack.herokuapp.com) for accessing the [Readium Slack](https://readium.slack.com), then select the channnels you're interested in (including "general", "r2-swift", "r2-kotlin" etc.).

### Mailing List

There is also a mailing list for the Readium projects, but it is essentially used for sending notifications to all interested parties.

To join, simply send mail to [the Readium Foundation contact](contact@readium.org), requesting access. 

You can also visit the [Google Readium mailing-list](https://groups.google.com/forum/?fromgroups#!forum/readium-dev) page, where you can also browse the archives and request access.

### Weekly Meetings

The Readium Dev meeting is held each Wednesday at 16:30 UTC.

It is hosted on Zoom and notified on Slack (#general channel, 15 mn before each call).

**Note!**

- Use your microphone and speakers (VoIP) - a headset is recommended.
- Please mute your phone if you are not talking to minimize interference.

### Face to Face Meetings

Once a year, we try to arrange a face-to-face meeting of the Readium members and contributors. These usually but not always coincide with major eBook conferences like the Digital Publishing Summit.

### Meeting Archives

The agenda and notes from all meetings are archived in the Readium Google Doc cloud space. You can access the archives [here](https://drive.google.com/drive/folders/0BzaNaBNAB6FjbzR5NWFVWVo2dDg).
