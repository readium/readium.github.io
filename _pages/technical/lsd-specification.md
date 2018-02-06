---
layout: post
title:  "Readium License Status Document Specification 1.0"
date:   2016-11-25 10:00:00 +0100
categories: specifications
permalink: /technical/readium-lsd-specification/
---

Copyright 2016, Readium Foundation. All Rights Reserved.

Document Revision: 1.2

## 1. Overview

### 1.1 Purpose and Scope

{:.information}
**This section is informative**

This specification, License Status Document (1.0), defines a document for representing the status of a DRM license along with interactions that might affect its status. These interactions put additional responsibilities on both Content Providers and Reading Systems.

One of the primary objectives is to support lending in public libraries where a user may have the ability to renew a time-limited loan or cancel one before it expires.

### 1.2. Terminology

This specification uses the following EPUB and Licensed Content Protection [[LCP](#normative-references)] terms:

**Publication**

A logical document entity consisting of a set of interrelated [resources](https://www.idpf.org/epub/30/spec/#gloss-publication-resource-cmt-or-foreign) and packaged in an EPUB Container, as defined by the [EPUB 3 specifications](https://www.idpf.org/epub/30/spec/#sibling-specs).

**User**

An individual that consumes an EPUB Publication using an EPUB Reading System.

**EPUB Reading System (or Reading System)**

A system that processes EPUB Publications for presentation to a User in a manner conformant with the [EPUB 3 specifications](https://www.idpf.org/epub/30/spec/#sibling-specs).

Additionally, it uses the following terms:

**Content Provider**

The authority that grants the License Document and the Publication to the User, usually a Web Server.

**License Document**

Document that contains references to the various keys and restrictions that are applied by a specific DRM on a Publication.

**Status Document**

Document that contains information about the history of a License Document, along with its current status and available interactions.

### 1.3. Example 

{:.information}
**This section is informative**

<em> In the following example, the Status Document indicates that the License has been registered for a single device and may be renewed or returned.</em>


    {
      "id": "234-5435-3453-345354",
      "status": "active",
      "message": "Your license is currently active and has been used on one device.",

      "updated": {
        "license": "2016-08-05T00:00:00Z",
        "status": "2016-08-08T00:00:00Z"
      },

      "links": [
        {"rel": "license",
         "href": "https://example.org/license/35d9b2d6",
         "type": "application/vnd.readium.lcp.license-1.0+json"},
        {"rel": "register",
         "href": "https://example.org/license/35d9b2d6/register{?id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true},
        {"rel": "return", 
         "href": "https://example.org/license/35d9b2d6/return{?id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true},
        {"rel": "renew",
         "href": "https://example.org/license/35d9b2d6/renew",
         "type": "text/html"},
        {"rel": "renew",
         "href": "https://example.org/license/35d9b2d6/renew{?end,id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true}
      ],
      "potential_rights": {
        "end": "2014-09-13T00:00:00Z"
      },
      "events": [
        {"type": "register", "name": "eBook App (Android)", "timestamp": "2016-07-14T00:00:00Z", "id": "709e1380-3528-11e5-a2cb-0800200c9a66"}
      ]
    }

### 1.4 Conformance Statements

The keywords <b>MUST</b>, <b>MUST NOT</b>, <b>REQUIRED</b>, <b>SHALL</b>, <b>SHALL NOT</b>, <b>SHOULD</b>, <b>SHOULD NOT</b>, <b>RECOMMENDED</b>, <b>MAY</b>, and <b>OPTIONAL</b> in this document are to be interpreted as described in [[RFC2119](#normative-references)].

All sections of this specification are normative except where identified by the informative status label "This section is informative". The application of informative status to sections and appendices applies to all child content and subsections they may contain.

All examples in this specification are informative.

## 2. Status Document

### 2.1. Content Conformance

A Status Document <b>MUST</b> meet all of the following criteria:

Document properties

It <b>MUST</b> meet the conformance constraints for JSON documents as defined in [JSON](#normative-references).
It <b>MUST</b> parse as a single JSON object.
It <b>MUST</b> be encoded using UTF-8.

Access to a Status Document <b>MUST NOT</b> require any form of authentication. 

A Status Document <b>SHOULD NOT</b> be served over an insecure connection. 

The MIME media type for a Status Document is `application/vnd.readium.license.status.v1.0+json`, and HTTP servers <b>MUST</b> set the “Content-Type” header appropriately.

### 2.2. Core Information

A Status Document <b>MUST</b> include the following information:

<table class="table-bordered large">
  <tr>
    <th>Key</th>
    <th>Semantics</th>
    <th>Format/data type</th>
  </tr>
  <tr>
    <td>id</td>
    <td>Unique identifier for the License Document associated to the Status Document.</td>
    <td>String</td>
  </tr>
  <tr>
    <td>status</td>
    <td>Current status of the License.</td>
    <td>Controlled vocabulary, as defined in section 2.3</td>
  </tr>
  <tr>
    <td>message</td>
    <td>A message meant to be displayed to the User regarding the current status of the license.</td>
    <td>String</td>
  </tr>
</table>


<br />
All messages provided in the message key <b>SHOULD</b> be localized based on the HTTP `Accept-Language` header included in the request for the Status Document.

### 2.3. Status

The `status` field succinctly describes the current status of the license. 
The following values are allowed:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>ready</td>
    <td>The License Document is available, but the user hasn't accessed the License and/or Status Document yet.</td>
  </tr>
  <tr>
    <td>active</td>
    <td>The license is active, and a device has been successfully registered for this license.
This is the default value if the License Document does not contain a registration link, or a registration mechanism through the license itself.</td>
  </tr>
  <tr>
    <td>revoked</td>
    <td>The license is no longer active, it has been invalidated by the Issuer.</td>
  </tr>
  <tr>
    <td>returned</td>
    <td>The license is no longer active, it has been invalidated by the User.</td>
  </tr>
  <tr>
    <td>cancelled</td>
    <td>The license is no longer active because it was cancelled prior to activation.</td>
  </tr>
  <tr>
    <td>expired</td>
    <td>The license is no longer active because it has expired.</td>
  </tr>
</table>

### 2.4. Timestamps

A Status Document <b>MUST</b> include an `updated` object where the following keys and associated timestamps are provided:

<table class="table-bordered large">
  <tr>
    <th>Key</th>
    <th>Semantics</th>
    <th>Format/data type</th>
  </tr>
  <tr>
    <td>license</td>
    <td>Time and Date when the License Document was last updated.</td>
    <td>ISO 8601 time and date</td>
  </tr>
  <tr>
    <td>status</td>
    <td>Time and Date when the Status Document was last updated.</td>
    <td>ISO 8601 time and date</td>
  </tr>
</table>

### 2.5. Links

A Status Document <b>MUST</b> include a `links` object.

A Status Document <b>MUST</b> include at least one link where the relation is set to `license`.

#### 2.5.1 The licence Relation
<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Templated?</th>
    <th>Required?</th>
    <th>HTTP Verb</th>
  </tr>
  <tr>
    <td>license</td>
    <td>Location of the License Document associated to the Status Document.</td>
    <td>No</td>
    <td>Yes</td>
    <td>GET</td>
  </tr>
</table>

#### 2.5.2. Link Object

Each Link Object contained in links supports the following keys:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Format/data type</th>
    <th>Required?</th>
  </tr>
  <tr>
    <td>href</td>
    <td>Link location.</td>
    <td>URI or URI Template</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>rel</td>
    <td>Link relationship to the document.</td>
    <td>List of well-known relation values, URIs for extensions</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>title</td>
    <td>Title of the link.</td>
    <td>String</td>
    <td>No</td>
  </tr>
  <tr>
    <td>type</td>
    <td>Expected MIME media type value for the external resources.</td>
    <td>MIME media type</td>
    <td>No, but highly recommended</td>
  </tr>
  <tr>
    <td>templated</td>
    <td>Indicates that the href is a URI Template.</td>
    <td>Boolean</td>
    <td>No, default value is "false"</td>
  </tr>
  <tr>
    <td>profile</td>
    <td>Expected profile used to identify the external resource.</td>
    <td>URI</td>
    <td>No</td>
  </tr>
</table>

### 2.6. Potential Rights

A Status Document <b>MAY</b> provide a list of potential changes allowed for a License Document using the `potential_rights` object.

This specification defines the following expression of potential rights:

<table class="table-bordered large">
  <tr>
    <th>Key</th>
    <th>Semantics</th>
    <th>Format/data type</th>
  </tr>
  <tr>
    <td>end</td>
    <td>Time and Date when the license ends.</td>
    <td>ISO 8601 time and date</td>
  </tr>
</table>


### 2.7. Events

A Status Document <b>MAY</b> provide an ordered list of events related to the change in status of a License Document.

These events are documented in an `events` object where the following keys are used to describe an event:

<table class="table-bordered large">
  <tr>
    <th>Key</th>
    <th>Semantics</th>
    <th>Format/data type</th>
  </tr>
  <tr>
    <td>type</td>
    <td>Identifies the type of event.</td>
    <td>See the enumeration below.</td>
  </tr>
  <tr>
    <td>name</td>
    <td>Name of the client, as provided by the client during an interaction.</td>
    <td>String</td>
  </tr>
  <tr>
    <td>id</td>
    <td>Identifies the client, as provided by the client during an interaction.</td>
    <td>String</td>
  </tr>
  <tr>
    <td>timestamp</td>
    <td>Time and date when the event occurred.</td>
    <td>ISO 8601 time and date</td>
  </tr>
</table>


The following `type` values are allowed:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>register</td>
    <td>Signals a successful registration event by a device.</td>
  </tr>
  <tr>
    <td>renew</td>
    <td>Signals a successful renew event.</td>
  </tr>
  <tr>
    <td>return</td>
    <td>Signals a successful return event.</td>
  </tr>
  <tr>
    <td>revoke</td>
    <td>Signals a revocation event.</td>
  </tr>
  <tr>
    <td>cancel</td>
    <td>Signals a cancellation event.</td>
  </tr>
</table>

## 3. Interactions

In addition to a standardized document, the LSD Specifications also defines a number of interactions that are all exposed through the `links` object.

### 3.1. Handling Errors

To provide a consistent behavior for both clients and end users, all servers must handle errors using the Problem Details JSON object as defined in [[RFC7807](#normative-references)] with the following additional requirements:

* The server <b>MUST</b> return a `title` and a `type` in the Problem Details JSON object

* The server <b>SHOULD</b> attempt to localize both `title` and `detail` based on the `Accept-Language` header sent by the client

Each interaction in this specification provides a number of Failure Types that are returned to the client if the interaction fails.

### 3.2. Checking the Status of a License

A client <b>SHOULD</b> on a regular basis retrieve a Status Document in order to update a License Document.

If the `license` timestamp in the `updated` object of the Status Document is more recent than the timestamp contained in the local copy of the License Document, the client <b>MUST</b> download the License Document again and replace its previous copy with the new one.

If the `status` value of a Status Document contradicts the corresponding up-to-date License Document, the License Document takes precedence.

If the Status Document is unavailable or if the client is unable to obtain an internet connection, it <b>MUST NOT</b> block the user from accessing the Publication tied to the License Document.

### 3.3. Registering a Device

Registration is meant to provide the server with a hint of how many clients have interacted with a License Document.

When a client opens a License Document for the first time and gets access to its associated Status Document:

* It <b>MUST</b> attempt to register itself using the link exposed in the Status Document

* It <b>MUST NOT</b> block the user from accessing the Publication associated to the License Document if the registration fails

* It <b>MUST</b> attempt to register itself again if it couldn't do so the first time that the License Document was opened

During the registration, the client <b>MUST</b> always try to send the same unique identifier for a specific device, no matter which Status Document it interacts with. Any further interaction with a provider <b>SHOULD</b> use the same identifier/name. The client <b>SHOULD</b> consider user privacy when generating a unique identifier, for example by generating a random string during software installation. To prevent user tracking across providers, the client <b>MAY</b> generate device unique ids for each provider.

If a provider uses registration to monitor license abuse, the provider <b>SHOULD</b> take care to prevent forged registrations.

<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Templated?</th>
    <th>Required?</th>
    <th>HTTP Verb</th>
  </tr>
  <tr>
    <td>register</td>
    <td>Associate a new device with the License</td>
    <td>Yes</td>
    <td>No</td>
    <td>POST</td>
  </tr>
</table>

<br />

<table class="table-bordered large">
  <tr>
    <th>Parameter</th>
    <th>Format</th>
    <th>Semantics</th>
    <th>Required ?</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>A unique identifier for the device.</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>name</td>
    <td>String</td>
    <td>Human readable name for the device.</td>
    <td>Yes</td>
  </tr>
</table>


<br />

*An example of a simple activation link.*

    {
      "links": [
        {"rel": "register", 
         "href": "https://example.org/license/aaa-bbbb-ccc/register{?id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true}
      ]
    }

*Expected Behavior*


<table class="table-bordered large">
  <tr>
    <th>Server side behavior</th>
    <th>HTTP status code</th>
    <th>Client side behavior</th>
  </tr>
  <tr>
    <td>The server registers the device identified by 'id' and returns an updated Status Document.
The server <b>MUST</b> update the timestamp of the Status Document contained in the status key of the updated object. 

If the status was previously set to ready, it <b>MUST</b> be updated by the server to active instead.

The server <b>MAY</b> also add a new event in the events object of the Status Document.</td>
    <td>200</td>
    <td style="width:150px">The client <b>MUST NOT</b> attempt to register the device again.</td>
  </tr>
</table>


*Failure Modes*

<table class="table-bordered large">
  <tr>
    <th>Type</th>
    <th>Status Code</th>
    <th>Title</th>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/registration</td>
    <td>400</td>
    <td>Your device could not be registered properly.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/server</td>
    <td>5xx</td>
    <td>An unexpected error has occurred.</td>
  </tr>
</table>

### 3.4. Returning a Publication

Returning a publication is meant primarily for library use cases, where a patron can return a publication early in order to get access to a new loan.

If returning is unsuccessful, the client <b>SHOULD</b> attempt to return the License again at a later time without necessarily asking the user again.

<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Templated?</th>
    <th>Required?</th>
    <th>HTTP Verb</th>
  </tr>
  <tr>
    <td>return</td>
    <td>Ask for the License to be immediately invalidated.</td>
    <td>Yes</td>
    <td>No</td>
    <td>PUT</td>
  </tr>
</table>

<br />

<table class="table-bordered large">
  <tr>
    <th> Parameter</th>
    <th>Format</th>
    <th>Semantics</th>
    <th>Required ?</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>A unique identifier for the device.</td>
    <td>No</td>
  </tr>
  <tr>
    <td>name</td>
    <td>String</td>
    <td>Human readable name for the device.</td>
    <td>No</td>
  </tr>
</table>


*An example of a simple return link.*


    {
      "links": [
        {"rel": "return",
         "href": "https://example.org/license/aaa-bbbb-ccc/return{?id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true}
      ]
    }


*Expected Behavior*

<table class="table-bordered large">
  <tr>
    <th>Server side behavior</th>
    <th>HTTP status code</th>
    <th>Client side behavior</th>
  </tr>
  <tr>
    <td>The server <b>MUST</b> return an updated Status Document.
The Status Document <b>MUST</b> contain a `status` with its value set to "returned" if the status was previously set to "active" or "cancelled" if the status was previously set to "ready".

The server <b>MUST</b> update the timestamp of both License and Status Document contained in the `status` and `license` keys of the `updated` object. 

The server <b>MAY</b> also add a new event in the `events` object of the Status Document.</td>
    <td>200</td>
    <td>The client <b>MUST</b> download an updated Status Document.

The client <b>MUST NOT</b> allow the user to open the publication anymore. 

The client <b>SHOULD NOT</b> attempt to return the License anymore.</td>
  </tr>
</table>


*Failure Modes*

<table class="table-bordered large">
  <tr>
    <th>Type</th>
    <th>Status Code</th>
    <th>Title</th>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/return</td>
    <td>400</td>
    <td>Your publication could not be returned properly.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/return/already</td>
    <td>403</td>
    <td>Your publication has already been returned before.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/return/expired</td>
    <td>403</td>
    <td>Your publication has already expired.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/server</td>
    <td>5xx</td>
    <td>An unexpected error has occurred.</td>
  </tr>
</table>

### 3.5. Renewing a License

Renewing a License is also meant primarily for library use cases, where a patron can renew a loan for an extended period of time.

<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Required?</th>
  </tr>
  <tr>
    <td>renew</td>
    <td>Extends the expiration date of a license into the future</td>
    <td>No</td>
  </tr>
</table>

<br/>

<table class="table-bordered large">
  <tr>
    <th>Media Type</th>
    <th>Semantics</th>
    <th>Templated?</th>
    <th>Verb</th>
  </tr>
  <tr>
    <td>text/html</td>
    <td>A URL where human interactions will be required. Returns an HTML page. These interactions <b>SHOULD</b> ultimately result in the extension of the term of a License Document.</td>
    <td>No</td>
    <td>GET</td>
  </tr>
  <tr>
    <td>application/vnd.readium.license.status.v1.0+json</td>
    <td>A URL where the License Document can be programmatically renewed. Returns a Status Document.</td>
    <td>Yes</td>
    <td>PUT</td>
  </tr>
</table>

<br />
These parameters are strictly for the case where the License Document is programmatically renewed.

<table class="table-bordered large">
  <tr>
    <th>Parameter</th>
    <th>Format</th>
    <th>Semantics</th>
    <th>Required ?</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>A unique identifier for the device.</td>
    <td>No</td>
  </tr>
  <tr>
    <td>name</td>
    <td>String</td>
    <td>Human readable name for the device.</td>
    <td>No</td>
  </tr>
  <tr>
    <td>end</td>
    <td>ISO 8601</td>
    <td>A new expiration date for the license</td>
    <td>No</td>
  </tr>
</table>

<br />

*An example with two renewal links: one meant for human interactions (HTML) and another for clients that can send the proper information to the server (returns a Status Document).*

    {
      "links": [
        {"rel": "renew",
         "href": "https://example.org/license/aaa-bbbb-ccc/renew",
         "type": "text/html"},
        {"rel": "renew"
         "href": "https://example.org/license/aaa-bbbb-ccc/renew{?end,id,name}",
         "type": "application/vnd.readium.license.status.v1.0+json",
         "templated": true}
      ]
    }

These status codes and behaviors are strictly for the case where the link returns a Status Document.

*Expected Behavior*

<table class="table-bordered large">
  <tr>
    <th>Server side behavior</th>
    <th>HTTP status code</th>
    <th>Client side behavior</th>
  </tr>
  <tr>
    <td>The server <b>MUST</b> return an updated Status Document.
The server <b>MUST</b> update the timestamp of both License and Status Document contained in the `status` and `license` keys of the `updated` object. 

The server <b>MAY</b> also add a new event in the `events` object of the Status Document.</td>
    <td>200</td>
    <td style="width:150px">The client <b>MUST</b> download an updated Status Document.
    The client <b>MAY</b> attempt to renew the License again later.</td>
  </tr>
</table>
<br/>

*Failure Modes*

<table class="table-bordered large">
  <tr>
    <th>Type</th>
    <th>Status Code</th>
    <th>Title</th>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/renew</td>
    <td>4xx</td>
    <td>Your publication could not be renewed properly.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/renew/date</td>
    <td>403</td>
    <td>Incorrect renewal period, your publication could not be renewed.</td>
  </tr>
  <tr>
    <td>http://readium.org/license-status-document/error/server</td>
    <td>5xx</td>
    <td>An unexpected error has occurred.</td>
  </tr>
</table>

## 4. Relationship to Readium Licensed Content Protection 1.0

### 4.1. Introduction

{:.information}
**This section is informative**

This specification defines a way for a Content Provider to connect an LCP License Document [LCP](#normative-references)] to a Status Document describing the current status of the underlying license.

It does not add any structural elements to the LCP License Document, but the link relations it defines and the potential rights it enumerates <b>MAY</b> appear in an LCP License Document.

### 4.2. The status Relation

This specification defines one new link relation which may be used in the `links` object of an LCP License Document.

<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Required?</th>
  </tr>
  <tr>
    <td>status</td>
    <td>Location of the Status Document associated with this License Document.</td>
    <td>No</td>
  </tr>
</table>


<br />

If a link with the relation status is not present in the `links` object, the client <b>MUST</b> process the LCP License Document according to the core LCP specification. 

If a link with the relation status is present in the `links` object, the client <b>MUST</b> process the Status Document according to the extended rules listed in [section 3](#3-interactions) of this specification.

The representation of the URI mentioned in the status link <b>MUST</b> be a valid Status Document.

## Normative references

[JSON] [The application/json Media Type for JavaScript Object Notation (JSON)](https://www.ietf.org/rfc/rfc4627).

[RFC2119] [Key words for use in RFCs to Indicate Requirement Levels](https://tools.ietf.org/html/rfc2119).

[RFC78707] [JSON Problem Details](https://tools.ietf.org/html/rfc7807).

[URI-Template] [URI Template](https://tools.ietf.org/html/rfc6570).

[LCP] [Readium Licensed Content Protection](http://readium.github.io/readium-lcp-specification).
