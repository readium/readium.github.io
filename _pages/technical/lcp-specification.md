---
layout: page
title:  "Readium Licensed Content Protection Specification 1.0"
date:   2016-11-25 10:00:00 +0100
categories: specification
permalink: //technical/readium-lcp-specification/

---

Copyright 2016, Readium Foundation. All Rights Reserved.

Document Revision: 1.2

## 1. Overview

### 1.1 Purpose and Scope

{:.information}
**This section is informative**

In order to deliver a Publication to a User with specific rights and restrictions, a Content Provider may want to encrypt the Publication’s Resources and associate them with a specific license. 

This specification, Licensed Content Protection (LCP), defines a standard License Document and an Encryption Profile for encrypting resources in EPUB 3 Publications, expressing rights and restrictions, and for securely delivering decryption keys to Reading Systems via licenses for specific Users.

LCP also defines a simple passphrase-based authentication method for Reading Systems to access encrypted resources and verify a license.

## 1.2. Terminology

### EPUB terms

This specification adopts [terms defined in the EPUB 3 family of specifications](https://www.idpf.org/epub/30/spec/#sec-gloss).  Important terms used include:

**Publication**

A logical document entity consisting of a set of interrelated [resources](https://www.idpf.org/epub/30/spec/#gloss-publication-resource-cmt-or-foreign) and packaged in an [EPUB Container](https://www.idpf.org/epub/30/spec/#gloss-container), as defined by the [EPUB 3 specifications](https://www.idpf.org/epub/30/spec/#sibling-specs).

**Publication Resource (or Resource)**

A resource that contains content or instructions that contribute to the logic and rendering of the [EPUB Publication](https://www.idpf.org/epub/30/spec/#gloss-epub-publication). In the absence of this resource, the Publication might not render as intended by the [Author](https://www.idpf.org/epub/30/spec/#gloss-author). Examples of Publication Resources include the [Package Document](https://www.idpf.org/epub/30/spec/#gloss-package-document), [EPUB Content Document](https://www.idpf.org/epub/30/spec/#gloss-content-document-epub)s, [EPUB Style Sheets](https://www.idpf.org/epub/30/spec/#gloss-stylesheet), audio, video, images, embedded fonts and scripts.

With the exception of the Package Document itself, Publication Resources must be listed in the [manifest](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-manifest-elem) element from [[Publications](#normative-references)] and must be bundled in the EPUB container file unless specified otherwise in [Publication Resource Locations](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-resource-locations) from [[Publications](#normative-references)].

Examples of resources that are not Publication Resources include those identified by the Package Document [link](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-link-elem) element from [[Publications](#normative-references)] and those identified in outbound hyperlinks that resolve outside the [EPUB Container](https://www.idpf.org/epub/30/spec/#gloss-container) (e.g., referenced from an HTML5 a element href attribute).

**Package Document**

A [Publication Resource](https://www.idpf.org/epub/30/spec/#gloss-publication-resource-cmt-or-foreign) carrying bibliographical and structural metadata about the [EPUB Publication](https://www.idpf.org/epub/30/spec/#gloss-epub-publication), as defined in [Package Documents](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-package-documents) from [[Publications](#normative-references)].

**EPUB Container (or Container)**

The ZIP-based packaging and distribution format for [EPUB Publication](https://www.idpf.org/epub/30/spec/#gloss-epub-publication)s defined in [[OCF](#normative-references)].

**User**

An individual that consumes an [EPUB Publication](https://www.idpf.org/epub/30/spec/#gloss-epub-publication) using an [EPUB Reading System](https://www.idpf.org/epub/30/spec/#gloss-epub-reading-system).

**EPUB Reading System (or Reading System)**

A system that processes [EPUB Publications](https://www.idpf.org/epub/30/spec/#gloss-epub-publication) for presentation to a [User](https://www.idpf.org/epub/30/spec/#gloss-user) in a manner conformant with the [EPUB 3 specifications](https://www.idpf.org/epub/30/spec/#sibling-specs).

### LCP terms

The following terms are defined by this specification:

**Protected Publication**

A Publication that has been protected according to this specification.

**License Authority**

The entity which operates the Readium LCP ecosystem.

**License Document**

Document that contains references to the various keys, links to related external resources, rights and restrictions that are applied to the Protected Publication, and user information. 

**Content Key**

Symmetric key used to encrypt the resources of the Protected Publication. In the License Document, this Content Key will be encrypted using the User Key.

**User Passphrase**

A string of text entered by the user that is used to generate the User Key.

**User Key**

A hash of the User Passphrase that is used to decrypt the Content Key and selected user information fields.

**Encryption Profile**

A set of encryption algorithms used in a specific Protected Publication and associated Licence Document.

**Content Provider (or Provider)**

An entity that delivers LCP licenses for Protected Publications to Users.

**Provider Certificate**

A certificate that is included in the License Document to identify the Content Provider and validate the signature of the License Document.

**Root Certificate**

A certificate that is embedded in the Reading System in order to confirm that the Provider Certificate is valid.

## 1.3. LCP Overview and Example

{:.information}
**This section is informative**

In order to encrypt Resources and expose its Encryption Profile, LCP relies on two different files:

* License Document (`META-INF/license.lcpl`)

* `META-INF/encryption.xml`

Both of these files are contained inside the EPUB Container, although the License Document can be transmitted initially outside the Container. Following the [[OCF](#normative-references)] specification, `META-INF/encryption.xml` identifies the Publication Resources that are protected and points to the Content Key needed to decrypt them. This Content Key is located inside the License Document and is itself encrypted using the third element of LCP, the User Key.  The User Key is generated by taking a hash of a User Passphrase. The User Key is used to decrypt the Content Key, which in turn is used to decrypt the Publication Resources.

The License Document may also contain links to external resources, information identifying the User, and information about what rights are conveyed to the User and which are not.  Rights information may include things like the time for which the license is valid, whether the book may be printed or copied, etc.  Finally, the License Document always includes a digital signature to prevent modification of any of its components.

Figure 1 shows the relationships among the various components of LCP.

![LCP components](/images/LCP_Archi_1.png)

### Protecting the Publication

To protect a Publication, the Provider follows these steps:

1. Generate a unique Content Key for the Publication.

2. Store this Content Key for future use in licensing the Publication.

3. Encrypt each protected Resource using that key, after compression if applicable.

4. Add these protected Resources to the Container, replacing the unprotected versions.

5. Create a `META-INF/encryption.xml` document (as described in section 2.2) that includes an EncryptedData element for each protected Resource that contains:

    a. An EncryptionMethod element that lists the algorithm used

    b. A KeyInfo element with a RetrievalMethod child that points to the Content Key in the License Document

    c. A CipherData element that identifies the protected Resource

6. Add `META-INF/encryption.xml` to the Container.

The Publication is now protected (i.e., has become a Protected Publication) and is ready for licensing to one or more Users.

### Licensing the Publication

After a User requests a Protected Publication, the following steps are followed by the Provider to license the Protected Publication:

1. Generate the User Key by hashing the User Passphrase (as described in section 4.2). It is assumed that the User and their User Passphrase are already known to the Provider.

2. Encrypt the Content Key for the Protected Publication using the User Key.

3. Create a License Document (`META-INF/license.lcpl`) with the following contents (as described in section 3):

    a. A unique ID for this license

    b. The date the license was issued

    c. The URI that identifies the Content Provider

    d. The encrypted Content Key

    e. Information about the User Key

    f. Links to additional information stored outside of the Protected Publication and License Document (optional)

    g. Information on specific rights being granted to the User (optional)

    h. Information identifying the User (optional).  Some of the fields in this section may be encrypted using the User Key.

4. Generate a digital signature for the License Document data and add to the License Document.

There are then two different methods to deliver the License Document and Protected Publication to the User:

1. **License Document included inside Protected Publication:**  The Provider adds the License Document to the Protected Publication’s Container and delivers this to the User.

2. **License Document delivered separately:** The Provider includes a link from the License Document to the Protected Publication, and then delivers just the License Document to the User. The Reading System processing the License Document will retrieve the Protected Publication and add the License Document to the Container of this Protected Publication.

Whichever method is used, the Reading System will be presented with an EPUB Container that includes the Protected Publication and the License Document.

### Reading the Publication

In order to decrypt and render a Protected Publication, the User’s Reading System will follow these steps:

1. Verify the signature for the License Document.

2. Get the User Key (if already stored) or generate it by hashing the User Passphrase.

3. Decrypt the Content Key using the User Key.

4. Decrypt the protected Resources using the Content Key.

## 1.4 Conformance Statements

The keywords <b>MUST</b>, <b>MUST NOT</b>, <b>REQUIRED</b>, <b>SHALL</b>, <b>SHALL NOT</b>, <b>SHOULD</b>, <b>SHOULD NOT</b>, <b>RECOMMENDED</b>, <b>MAY</b>, and <b>OPTIONAL</b> in this document are to be interpreted as described in [[RFC2119](#normative-references)].

All sections of this specification are normative except where identified by the informative status label "This section is informative". The application of informative status to sections and appendices applies to all child content and subsections they <b>MAY</b> contain.

All examples in this specification are informative.

# 2. Publication

## 2.1. Introduction

{:.information}
**This section is informative**

LCP follows the [[OCF](#normative-references)] specification to identify encrypted Resources within the EPUB Container. Specifically, LCP uses `META-INF/encryption.xml` to indicate which Resources listed in the Package Document are encrypted and to reference the Content Key.

## 2.1. Encrypted Resources

In order to make sure that Protected Publications remain identifiable by Reading Systems, a certain number of Resources are prohibited from being encrypted.

LCP inherits the following list of files prohibited from being encrypted from the [[OCF](#normative-references)] specification:

* `mimetype`

* `META-INF/container.xml`

* `META-INF/encryption.xml`

* `META-INF/manifest.xml`

* `META-INF/metadata.xml`

* `META-INF/rights.xml`

* `META-INF/signatures.xml`

* EPUB `rootfiles` (the Package Document for any rendition)

In addition, this specification defines that the following files <b>MUST NOT</b> be encrypted:

* `META-INF/license.lcpl`

* Navigation Documents referenced in any Package Document from the Publication (all Publication Resources listed in the Publication manifest with the ["nav" property](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-item-property-values))

* NCX documents referenced in any Package Document from the Publication (all Publication Resources listed in the Publication manifest with the media type "application/x-dtbncx+xml")

* Cover images (all Publication Resources listed in the Publication manifest with the ["cover-image" property](https://www.idpf.org/epub/30/spec/epub30-publications.html#sec-item-property-values))

## 2.2. Using META-INF/encryption.xml for LCP

As defined in the [[OCF](#normative-references)] specification, all encrypted Publication Resources <b>MUST</b> be identified in the well-known file `META-INF/encryption.xml` using [[XML-ENC](#normative-references)]. 

In Publications protected using LCP, there are additional requirements for identifying the key used to encrypt these Resources (the LCP Content Key):

1. The `ds:KeyInfo` element <b>MUST</b> point to the Content Key using the `ds:RetrievalMethod` element.  

2. The `URI` attribute of `ds:RetrievalMethod` <b>MUST</b> use a value of "`license.lcpl#/encryption/content_key`" to point to the encrypted Content Key stored in the License Document. This URI follows the [[JSON Pointer](#normative-references)] specification.

3. The `Type` attribute <b>MUST</b> use a value of "`http://readium.org/2014/01/lcp#EncryptedContentKey`" to identify the target of the URI as an encrypted Content Key.

*In the following example, adapted from [[OCF](#normative-references)]*, an image.jpeg resource is encrypted using AES with the Content Key.*

```xml
<encryption
    xmlns ="urn:oasis:names:tc:opendocument:xmlns:container"
    xmlns:enc="http://www.w3.org/2001/04/xmlenc#"
    xmlns:ds="http://www.w3.org/2000/09/xmldsig#">

    <enc:EncryptedData Id="ED1">
        <enc:EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#aes256-cbc"/>
        <ds:KeyInfo>
            <ds:RetrievalMethod URI="license.lcpl#/encryption/content_key"
                Type="http://readium.org/2014/01/lcp#EncryptedContentKey"/>
        </ds:KeyInfo>
        <enc:CipherData>
            <enc:CipherReference URI="image.jpeg"/>
        </enc:CipherData>
    </enc:EncryptedData>
</encryption>
```


# 3. License Document

## 3.1. Introduction

{:.information}
**This section is informative**

While `META-INF/encryption.xml` describes how the Resources are encrypted and where the encrypted Content Key is located, all of the other relevant information for LCP is stored in the License Document.

This specification defines the License Document’s syntax, location in the Container, media type, file extension and processing model.

## 3.2. Content Conformance

A License Document <b>MUST</b> meet all of the following criteria:

Document properties

* It <b>MUST</b> meet the conformance constraints for JSON documents as defined in [[JSON](#normative-references)].

* It <b>MUST</b> be encoded using UTF-8.

File properties

* Its filename <b>MUST</b> use the file extension `.lcpl`.

* Its MIME media type is `application/vnd.readium.lcp.license.v1.0+json`

* Its location in the Container <b>MUST</b> be `META-INF/license.lcpl`

## 3.3. Core License Information

The License Document <b>MUST</b> contain the following name/value pairs:

<table class="table-bordered large">
	<tr>
	  <th>Name</th>
	  <th>Value</th>
	  <th>Format/data type</th>
	</tr>
	<tr>
	  <td>id</td>
	  <td>Unique identifier for the License</td>
	  <td>String</td>
	</tr>
	<tr>
	  <td>issued</td>
	  <td>Date when the license was first issued</td>
	  <td>ISO 8601</td>
	</tr>
	<tr>
	  <td>provider</td>
	  <td>Unique identifier for the Provider</td>
	  <td>URI</td>
	</tr>
</table>

<br>
In addition, the License Document <b>MAY</b> contain the following name/value pair:

<table class="table-bordered large">
	<tr>
	  <th>Name</th>
	  <th>Value</th>
	  <th>Format/data type</th>
	</tr>
	<tr>
	  <td>updated</td>
	  <td>Date when the license was last updated</td>
	  <td>ISO 8601</td>
	</tr>
</table>


## 3.4. Transmitting keys:  The encryption object

In addition to Core License information, the License Document <b>MUST</b> contain an `encryption` object with the following name/value pair:

<table class="table-bordered large">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
      <th>Format/data type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>profile</td>
      <td>Identifies the Encryption Profile used by this LCP-protected Publication</td>
      <td>URI</td>
    </tr>
  </tbody>
</table>

<br />
The `encryption` object <b>MUST</b> also contain the following two objects: `content_key` and `user_key`.

The `encryption/content_key` object contains the Content Key (encrypted using the User Key) used to encrypt the Publication Resources. It <b>MUST</b> contain the following name/value pairs:

<table class="table-bordered large">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
      <th>Format/data type</th>
    </tr>
  </thead>
  <tbody>
  	<tr>
	    <td>encrypted_value</td>
	    <td>Encrypted Content Key</td>
	    <td>Base 64 encoded octet sequence</td>
	  </tr>
	  <tr>
	    <td>algorithm</td>
	    <td>Algorithm used to encrypt the Content Key, identified using the URIs defined in [XML-ENC]. This <b>MUST</b> match the Content Key encryption algorithm named in the Encryption Profile identified in `encryption/profile`.</td>
	    <td>URI</td>
	  </tr>
  </tbody>
</table>

<br />
The `encryption/user_key` object contains information regarding the User Key used to encrypt the Content Key. It <b>MUST</b> contain the following name/value pairs:

<table class="table-bordered large">
  <thead>
   <tr>
     <th>Name</th>
     <th>Value</th>
     <th>Format/data type</th>
   </tr>
  </thead>
  <tbody> 
   <tr>
     <td>text_hint</td>
     <td>A hint to be displayed to the User to help them remember the User Passphrase</td>
     <td>String</td>
   </tr>
   <tr>
     <td>algorithm</td>
     <td>Algorithm used to generate the User Key from the User Passphrase, identified using the URIs defined in [XML-ENC]. This <b>MUST</b> match the User Key hash algorithm named in the Encryption Profile identified in `encryption/profile`.</td>
     <td>URI</td>
   </tr>
   <tr>
     <td>key_check</td>
     <td>The value of the License Document’s `id` field, encrypted using the User Key and the same algorithm identified for Content Key encryption in `encryption/content_key/algorithm`. This is used to verify that the Reading System has the correct User Key.</td>
     <td>Base 64 encoded octet sequence</td>
   </tr>
  </tbody>
</table>

<br />
*This example shows the encryption information for a License Document that uses the base Encryption Profile for LCP 1.0.*

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": {
    "profile": "http://readium.org/lcp/basic-profile",
    "content_key": {
      "encrypted_value": "/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ==",
      "algorithm": "http://www.w3.org/2001/04/xmlenc#aes256-cbc"
    },
    "user_key": {
      "text_hint": "Enter your email address",
        "algorithm": "http://www.w3.org/2001/04/xmlenc#sha256",
        "key_check": "jJEjUDipHK3OjGt6kFq7dcOLZuicQFUYwQ+TYkAIWKm6Xv6kpHFhF7LOkUK/Owww"
    }
  },
  "links": "...",
  "rights": "...",
  "signature": "..."
}
```


## 3.5. Pointing to external resources: the links object

A License Document <b>MUST</b> also contain a `links` object.  This is used to associate the License Document with resources that are not locally available.  

Each Link Object nested in `links` contains the link URI, a link relationship and an <b>OPTIONAL</b> set of other link properties.

### Link relationships

This specification introduces the following link relationships for each Link Object:

<table class="table-bordered large">
  <tr>
    <th>Relation</th>
    <th>Semantics</th>
    <th>Required?</th>
  </tr>
  <tr>
    <td>hint</td>
    <td>Location where a Reading System can redirect a User looking for additional information about the User Passphrase.</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>publication</td>
    <td>Location where the Publication associated with the License Document can be downloaded</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>self</td>
    <td>As defined in the IANA registry of link relations: "Conveys an identifier for the link's context."</td>
    <td>No</td>
  </tr>
  <tr>
    <td>support</td>
    <td>Support resources for the user (either a website, an email or a telephone number).</td>
    <td>No</td>
  </tr>
</table>

<br />
In addition to these link relations, this specification introduces the [LCP Link Relations Registry](#informative-references). All official link relations used in the License Document and declared in official LCP specification documents <b>MUST</b> be referenced in the registry.

Link relations <b>MAY</b> also be extended for vendor-specific applications. Such links <b>MUST</b> use a URI instead of a string to identify their link relations.

### Link Object

Each Link Object supports the following keys:

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
  <tr>
    <td>length</td>
    <td>Content length in octets.</td>
    <td>Integer</td>
    <td>No</td>
  </tr>
  <tr>
    <td>hash</td>
    <td>SHA-256 hash of the resource.</td>
    <td>Base 64 encoded octet sequence</td>
    <td>No</td>
  </tr>
</table>

<br />
Templated URIs follow the [[URI-Template]](#informative-references) specification.
 
*In this example, the License Document points to a publication, contains the location of a hint about its User Passphrase and uses an extension to* ***provide authentication and recommandation services***.

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": "...",
  "links": [
    { "rel": "publication",
      "href": "https://www.example.com/file.epub",
      "type": "application/epub+zip",
      "length": "264929",
      "hash": "8b752f93e5e73a3efff1c706c1c2e267dffc6ec01c382cbe2a6ca9bd57cc8378"
    },
    { "rel": "hint",
      "href": "https://www.example.com/passphraseHint?user_id=1234",
      "type": "text/html"
    },
    { "rel": "support",
      "href": "mailto:support@example.org"
    }, 
    { "rel": "support",
      "href": "tel:1800836482"
    },
    { "rel": "support",
      "href": "https://example.com/support",
      "type": "text/html"
    }, 
    { "rel": "https://mylcpextension.com/authentication",
      "href": "https://www.example.com/authenticateMe",
      "title": "Authentication service",
      "type": "application/vnd.myextension.authentication+json"
    },
    { "rel": "https://mylcpextension.com/book_recommendations",
      "href": "https://www.example.com/recommended/1", 
      "type": "text/html"
    },
    { "rel": "https://mylcpextension.com/book_recommendations",
      "href": "https://www.example.com/recommended/1.opds",
      "type": "application/atom+xml; profile=opds-catalog; kind=acquisition"}
  ], 
  "rights": "...",
  "signature": "..."
}
```


## 3.6. Identifying rights and restrictions: the rights object

 

The License Document <b>MAY</b> also express a series of rights using the `rights` object.  The `rights` object <b>MAY</b> include the following fields:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Format/data type</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>print</td>
    <td>Maximum number of pages that can be printed over the lifetime of the license</td>
    <td>Integer</td>
    <td>Unlimited</td>
  </tr>
  <tr>
    <td>copy</td>
    <td>Maximum number of characters that can be copied to the clipboard over the lifetime of the license</td>
    <td>Integer</td>
    <td>Unlimited</td>
  </tr>
  <tr>
    <td>start</td>
    <td>Date and time when the license begins</td>
    <td>ISO 8601 date</td>
    <td>None (perpetual license)</td>
  </tr>
  <tr>
    <td>end</td>
    <td>Date and time when the license ends</td>
    <td>ISO 8601 date</td>
    <td>None (perpetual license)</td>
  </tr>
  <tr>
    <td>[Extension URI]</td>
    <td>[Defined by implementor]</td>
    <td>[Defined by implementor]</td>
    <td>[Defined by implementor]</td>
  </tr>
</table>

<br/>
All name/value pairs using an integer as their data type (print and copy for this specification) <b>MUST NOT</b> use leading zeroes in values (e.g., "9", not “09”).

For the `print` right, a page is defined as follows:

1. The page as defined in the Publication, if it is pre-paginated (fixed layout) OR

2. The page as defined by the [page-list nav element](https://www.idpf.org/epub/30/spec/epub30-contentdocs.html#sec-xhtml-nav-def-types-pagelist) of the [EPUB Navigation Document](https://www.idpf.org/epub/30/spec/epub30-contentdocs.html#sec-xhtml-nav), if this exists OR

3. 1024 Unicode characters for all other cases

The `copy` right only covers the ability to copy to the clipboard and is limited to text (no images, etc.).

In addition to these rights, this specification introduces the [LCP Rights Registry](#informative-references). All official rights information used in the License Document and declared in official LCP specification documents <b>MUST</b> be referenced in the registry.

The `rights` object <b>MAY</b> be extended to include any number of implementor-specific rights. Each extension right <b>MUST</b> be identified using a URI controlled by the implementor.

*In this example, the License Document grants the following rights: not allowed to print at all, copy up to 2048 characters at a time of the book, and the license has an expiration date.
There is also a vendor extension granting the right to tweet parts of this book.*

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": "...",
  "links": "...",
  "rights": {
    "print": 0,
    "copy": 2048,
    "start": "2013-11-04T01:08:15+01:00",
    "end": "2013-11-25T01:08:15+01:00",
    "https://www.imaginaryebookretailer.com/lcp/rights/tweet": true
  },
  "signature": "..."
}
```

## 3.7. Identifying the user: the user object

The License Document <b>MAY</b> embed information about the user using the `user` object. The `user` object includes the following fields:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Format/data type</th>
    <th>Required?</th>
  </tr>
  <tr>
    <td>id</td>
    <td>Unique identifier for the User at a specific Provider</td>
    <td>String</td>
    <td>No, but highly recommended</td>
  </tr>
  <tr>
    <td>email</td>
    <td>The User’s e-mail address</td>
    <td>String</td>
    <td>No</td>
  </tr>
  <tr>
    <td>name</td>
    <td>The User’s name</td>
    <td>String</td>
    <td>No</td>
  </tr>
  <tr>
    <td>encrypted</td>
    <td>A list of which user object values are encrypted in this License Document</td>
    <td>Array of one or more strings matching the above names or an extension</td>
    <td>Yes, if encryption is used for any field</td>
  </tr>
  <tr>
    <td>[Extension URI]</td>
    <td>[Defined by implementor]</td>
    <td>[Defined by implementor]</td>
    <td>[Defined by implementor]</td>
  </tr>
</table>

<br />
In addition to these user information, this specification introduces the [LCP User Fields Registry](#informative-references). All official user fields used in the License Document and declared in official LCP specification documents <b>MUST</b> be referenced in the registry.

As with rights, The `user` object <b>MAY</b> be extended to include any number of implementor-specific fields. Each extension field <b>MUST</b> be identified by a URI controlled by the implementor.

To protect private User data, any of these fields <b>MAY</b> be encrypted, except for the `encrypted` field, which <b>MUST</b> remain in plain text. If encrypted, the field values <b>MUST</b> be encrypted using the User Key and the same encryption algorithm identified in the `encryption/content_key` object. The names of all encrypted fields <b>MUST</b> be listed in the `encrypted` array.

*In the following example, an identifier, a provider and an email are provided. There is also an extension to indicate the user’s preferred language. The email is encrypted.*

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": "...",
  "links": "...",
  "rights": "...",
  "user": {
    "id": "d9f298a7-7f34-49e7-8aae-4378ecb1d597",
    "email": "EnCt2b8c6d2afd94ae4ed201b27049d8ce1afe31a90ceb8c6d2afd94ae4ed201b2704RjkaXRveAAarHwdlID1KCIwEmS",
    "encrypted": ["email"],
      "https://www.imaginaryebookretailer.com/lcp/user/language": "tlh"
  },
  "signature": "..."
}
```

## 3.8. Signing the license: the signature object

As described in [5. Signature and Public Key Infrastructure](#signature-and-public-key-infrastructure), the License Document includes a digital signature to validate that it has not been altered.  The License Document <b>MUST</b> include information about the signature using the `signature` object. The `signature` object <b>MUST</b> include the following fields:

<table class="table-bordered large">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Format/data type</th>
  </tr>
  <tr>
    <td>algorithm</td>
    <td>Algorithm used to calculate the signature, identified using the URIs given in [XML-SIG].  This <b>MUST</b> match the signature algorithm named in the Encryption Profile identified in `encryption/profile`.</td>
    <td>URI</td>
  </tr>
  <tr>
    <td>certificate</td>
    <td>The Provider Certificate: an X509 certificate used by the Content Provider</td>
    <td>Base 64 encoded DER certificate</td>
  </tr>
  <tr>
    <td>value</td>
    <td>Value of the signature</td>
    <td>Base 64 encoded octet sequence</td>
  </tr>
</table>

<br />
For more information on how the signature and the certificate <b>SHOULD</b> be calculated, encoded and processed, see [5. Signature and Public Key Infrastructure](#signature-and-public-key-infrastructure).

*This example shows the License Document signature.*

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": "...",
  "links": "...",
  "rights": "...",
  "user": "...",
  "signature": {
    "algorithm": "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256",
    "certificate": "MIIDEjCCAfoCCQDwMOjkYYOjPjANBgkqhkiG9w0BAQUFADBLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTETMBEGA1UEBxMKRXZlcnl3aGVyZTESMBAGA1UEAxMJbG9jYWxob3N0MB4XDTE0MDEwMjIxMjYxNloXDTE1MDEwMjIxMjYxNlowSzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExEzARBgNVBAcTCkV2ZXJ5d2hlcmUxEjAQBgNVBAMTCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOpCRECG7icpf0H37kuAM7s42oqggBoikoTpo5yapy+s5eFSp8HSqwhIYgZ4SghNLkj3e652SALav7chyZ2vWvitZycY+aq50n5UTTxDvdwsC5ZNeTycuzVWZALKGhV7VUPEhtWZNm0gruntronNa8l2WS0aF7P5SbhJ65SDQGprFFaYOSyN6550P3kqaAO7tDddcA1cmuIIDRf8tOIIeMkBFk1Qf+lh+3uRP2wztOTECSMRxX/hIkCe5DRFDK2MuDUyc/iY8IbY0hMFFGw5J7MWOwZLBOaZHX+Lf5lOYByPbMH78O0dda6T+tLYAVzsmJdHJFtaRguCaJVtSXKQUAMCAwEAATANBgkqhkiG9w0BAQUFAAOCAQEAi9HIM+FMfqXsRUY0rGxLlw403f3YtAG/ohzt5i8DKiKUG3YAnwRbL/VzXLZaHru7XBC40wmKefKqoA0RHyNEddXgtY/aXzOlfTvp+xirop+D4DwJIbaj8/wHKWYGBucA/VgGY7JeSYYTUSuz2RoYtjPNRELIXN8A+D+nkJ3dxdFQ6jFfVfahN3nCIgRqRIOt1KaNI39CShccCaWJ5DeSASLXLPcEjrTi/pyDzC4kLF0VjHYlKT7lq5RkMO6GeC+7YFvJtAyssM2nqunA2lUgyQHb1q4Ih/dcYOACubtBwW0ITpHz8N7eO+r1dtH/BF4yxeWl6p5kGLvuPXNU21ThgA==",
    "value": "q/3IInic9c/EaJHyG1Kkqk5v1zlJNsiQBmxz4lykhyD3dA2jg2ZzrOenYU9GxP/xhe5H5Kt2WaJ/hnt8+GWrEx1QOwnNEij5CmIpZ63yRNKnFS5rSRnDMYmQT/fkUYco7BUi7MPPU6OFf4+kaToNWl8m/ZlMxDcS3BZnVhSEKzUNQn1f2y3sUcXjes7wHbImDc6dRthbL/E+assh5HEqakrDuA4lM8XNfukEYQJnivqhqMLOGM33RnS5nZKrPPK/c2F/vGjJffSrlX3W3Jlds0/MZ6wtVeKIugR06c56V6+qKsnMLAQJaeOxxBXmbFdAEyplP9irn4D9tQZKqbbMIw=="
  }
}
```


# 4. User Key

## 4.1. Introduction

{:.information}
**This section is informative**

In order for any symmetrically-encrypted message to work, there must be an agreed-upon key shared by the sender and receiver.  In LCP, this is the User Key. The Provider must have access to the User Key in order to secure the Content Key within the License Document. The Reading System must also have the User Key in order to decrypt the Content Key in the License Document.

LCP uses a passphrase model for sharing the User Key: in a simple implementation, when the Reading System receives a new License Document, it prompts the User for a passphrase to access the Content Key.  LCP defines the User Key as a hash of this User Passphrase. This passphrase can be anything at all: a User-defined password, a Provider-defined password, an e-mail address, a library card number, etc. 

## 4.2. Calculating the User Key

The User Passphrase <b>MUST</b> be a UTF-8 encoded string. There are no restrictions on the length or content of the User Passphrase. There are no requirements for how it is to be created.

The User Key is the result of applying a hashing function on the User Passphrase, using the hash algorithm provided in the `encryption/user_key` object in the License Document. Processing of any kind, including whitespace escaping or normalization, <b>SHALL NOT</b> be done on the User Passphrase before hashing.

## 4.3. Hints

In order to facilitate the entry of the passphrase by the User, the LCP License Document supports two ways for the Reading System to provide passphrase prompts or hints to the User:

1. The `user_key/text_hint` field is a simple prompt that can be displayed to the User when entering the User Passphrase (e.g., "Enter your Imaginary Book Retailer password").

2. The `links` object with `rel=hint` points to a location that provides passphrase hints or other assistance.

The content of `user_key/text_hint` and of the resource pointed to by the `links` object with `rel=hint` <b>SHOULD</b> be human-readable, directed to the User, and <b>SHOULD</b> help the User enter their passphrase.

## 4.4. Requirements for the User Key & User Passphrase

In order to simplify the process for accessing Protected Publications, the Provider <b>SHOULD</b> use the same User Key for all licenses issued to the same User.

The security of LCP depends in large part on the security of the User Key and User Passphrase. Therefore, special care <b>SHOULD</b> be taken to secure these throughout the licensing workflow:

1. Passphrases <b>SHOULD</b> be sufficiently complex to prevent brute-force attacks.

2. Passphrases <b>MUST NOT</b> be transmitted in plaintext. 

3. If the Provider needs to share User Key information among multiple systems, they <b>SHOULD</b> transmit User Keys and not User Passphrases, and <b>SHOULD</b> transmit this information over secure channels. 

4. User Passphrases <b>MUST NOT</b> be stored by the Reading System; instead it <b>SHOULD</b> only store User Keys.

# 5. Signature and Public Key Infrastructure

## 5.1. Introduction

{:.information}
**This section is informative**

Given the importance of the precise expression of various objects in the License Document, it is critical that the Reading System be able to verify that the content of the License Document is authentic and has not been altered. This is done via a digital signature that is verified via a Public Key Infrastructure as defined in [[X509](#normative-references)].

Calculating a signature is done on a byte stream, which is unique, while the License Document is a JSON document where multiple representations might lead to the same structure. Thus, to ensure a stable signature between the Reading System and the Content Provider, some transformations must be applied prior to signing the Document and verifying the signature.

The steps <b>REQUIRED</b> of the Provider to sign the License Document are:

1. The contents of the License Document (minus the signature object) are put in a canonical form: alphabetized with non-significant whitespace removed (see [Section 5.3](#canonical-form-of-the-license-document))

2. The signature value for the canonical form of the License Document is calculated following the algorithm identified in the Encryption Profile.  This typically will involve taking a hash of the data and encrypting it using the private key.

3. The signature value and the Provider Certificate are added to the License Document in the `signature` object, as described in [Section 3.8](#signing-the-license-the-signature-object).

The steps <b>REQUIRED</b> of the Reading System to validate the signature are:

1. Obtain the Root Certificate from the License Authority.  This certificate is embedded in the Reading System to validate all Provider Certificates.

2. Using this Root Certificate, validate the Provider Certificate that is included in the `signature` object. This prevents another entity who is not the Provider from forging License Documents. 

3. Strip the `signature` object from the License Document.

4. Put the remainder of the License Document contents into canonical form.

5. Calculate the hash of the canonical License Document data using the signature algorithm identified in the Encryption Profile.

6. Decrypt the signature value given in the signature object using the public key given in the Provider Certificate and confirm that it matches the calculated hash.  This confirms that the contents of the License Document have not been altered in transit.

Because the Provider Certificate is included in the License Document and the Root Certificate is embedded in the Reading System, the entire validation process can take place without any Internet connectivity.

To make sure that the Provider Certificate has not been revoked, the Reading System also checks a Certificate Revocation List maintained by the Readium Foundation.  In order to facilitate offline reading, the Reading System does not need to check the revocation list every time it processes a License Document.  It is only necessary that it updates the list regularly when an Internet connection is available (e.g., every time it downloads a new License or book).

## 5.2. Certificates

### 5.2.1 Provider Certificates

Content Providers <b>MUST</b> have a Certificate in the [[X509](#normative-references)] v3 format issued and signed by the License Authority using the Root Certificate: this is referred to here as the Provider Certificate. The subject of the Provider Certificate <b>SHOULD</b> represent the Content Provider. 

Content Providers <b>MUST</b> distribute their Provider Certificate in any License Document they issue in the `signature/certificate` field. They also <b>MUST</b> use the private key paired with their Provider Certificate’s public key to sign the License Document. For a License Document to be considered valid, the Provider Certificate <b>MUST</b>  have been valid at the time the License Document was issued (as indicated by the `issued` field), and the Provider Certificate <b>MUST NOT</b> have been revoked.

### 5.2.2 Root Certificate

Reading Systems <b>MUST</b> obtain the Root Certificate in the [[X509](#normative-references)] v3 format from the License Authority, and <b>SHOULD</b> keep it up to date. It <b>MUST</b> be embedded in the Reading System for offline use.

## 5.3. Canonical form of the License Document

The canonical form of the License Document is used when calculating and validating the signature. To create the canonical form of the License Document, the following serialization rules must be followed:

1. Since it is product of the calculation, the `signature` object of the License Document <b>MUST</b> be removed.

2. All object members (name/value pairs) of the License Document <b>MUST</b>** **be sorted in lexicographical order of their names according to their representation in UTF-8 (United Character Set code point value). Note that this rule is recursive, so that members are sorted at all levels of object nesting.

3. Within arrays, the order of elements <b>MUST NOT</b> be altered.

4. Numbers <b>MUST NOT</b> include insignificant leading or trailing zeroes. Numbers that include a fraction part (non-integers) <b>MUST</b> be expressed as a number, fraction, and exponent (normalized scientific notation) using an upper-case "E".

5. Strings <b>MUST</b> use escaping only for those characters for which it is <b>REQUIRED</b> by [[JSON](#normative-references)]: backslash (\), double-quotation mark ("), and control characters (U+0000 through U+001F). When escaping control characters, the hexadecimal digits <b>MUST</b> be upper case.

6. Non-significant whitespace (as defined in [[JSON](#normative-references)]) <b>MUST</b> be removed. Whitespace found within strings <b>MUST</b> be kept.

### 5.3.1. Example

{:.information}
**This section is informative**

For this example, we'll use a License Document which contains a link (hint) and basic user information.

```json
{
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "updated": "2014-02-21T09:44:17+01:00",
  "provider": "https://www.imaginaryebookretailer.com",
  "encryption": {
    "profile": "http://readium.org/lcp/basic-profile",
    "content_key": {
      "encrypted_value": "/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ==",
      "algorithm": "http://www.w3.org/2001/04/xmlenc#aes256-cbc"
    },
    "user_key": {
      "text_hint": "Enter your email address",
        "algorithm": "http://www.w3.org/2001/04/xmlenc#sha256",
        "key_check": "jJEjUDipHK3OjGt6kFq7dcOLZuicQFUYwQ+TYkAIWKm6Xv6kpHFhF7LOkUK/Owww"
    }
  },
  "links": [
    { "rel": "hint", "href": "https://www.imaginaryebookretailer.com/lcp/hint", "type": "text/html"}
  ],
  "user": { "id": "d9f298a7-7f34-49e7-8aae-4378ecb1d597"}
}
```


First of all, let's sort this document. Every [[JSON](#normative-references)] object needs to be sorted:

```json
{
  "encryption": {
    "content_key": {
      "algorithm": "http://www.w3.org/2001/04/xmlenc#aes256-cbc",
      "encrypted_value": "/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ=="
    },
    "profile": "http://readium.org/lcp/basic-profile",
    "user_key": {
      "algorithm": "http://www.w3.org/2001/04/xmlenc#sha256",
      "key_check": "jJEjUDipHK3OjGt6kFq7dcOLZuicQFUYwQ+TYkAIWKm6Xv6kpHFhF7LOkUK/Owww",
      "text_hint": "Enter your email address"
    }
  },
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "issued": "2013-11-04T01:08:15+01:00",
  "links": [
    {
      "rel": "hint",
      "href": "https://www.imaginaryebookretailer.com/lcp/hint",
      "type": "text/html"
    }
  ],
  "provider": "https://www.imaginaryebookretailer.com",
  "updated": "2014-02-21T09:44:17+01:00",
  "user": {"id": "d9f298a7-7f34-49e7-8aae-4378ecb1d597"}
}
```


Now that our document is sorted, we can strip all whitespaces and end of lines:

```json
{"encryption":{"content_key":{"algorithm":"http://www.w3.org/2001/04/xmlenc#aes256-cbc","encrypted_value":"/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ=="},"profile":"http://readium.org/lcp/basic-profile","user_key":{"algorithm":"http://www.w3.org/2001/04/xmlenc#sha256","key_check":"jJEjUDipHK3OjGt6kFq7dcOLZuicQFUYwQ+TYkAIWKm6Xv6kpHFhF7LOkUK/Owww","text_hint":"Enter your email address"}},"id":"ef15e740-697f-11e3-949a-0800200c9a66","issued":"2013-11-04T01:08:15+01:00","links":[{"rel":"hint","href":"https://www.imaginaryebookretailer.com/lcp/hint","type":"text/html"}],"provider":"https://www.imaginaryebookretailer.com","updated":"2014-02-21T09:44:17+01:00","user":{"id":"d9f298a7-7f34-49e7-8aae-4378ecb1d597"}}
```


## 5.4. Generating the signature

In order to sign a License Document, the Content Provider <b>MUST</b> go through the following steps in order:

1. The Content Provider <b>MUST</b> create the canonical form of the License Document following the rules given in [5.3. Canonical form of the License Document](#canonical-form-of-the-license-document).

2. The Content Provider <b>MUST</b> calculate the signature using this canonical form of the License Document and using the algorithm described in the `algorithm` field with the private key of the Provider Certificate.

3. The signature <b>MUST</b> be embedded in the `value` field of the `signature` object using Base 64 encoding.

4. The Provider Certificate used to validate the signature <b>MUST</b> be inserted in the `certificate` field. It <b>MUST</b> use the DER notation and be encoded using Base 64.

### 5.4.1. Example

{:.information}
**This section is informative**

Given the License Document in its canonical form

```json
{"encryption":{"content_key":{"algorithm":"http://www.w3.org/2001/04/xmlenc#aes256-cbc","encrypted_value":"/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ=="},"profile":"http://readium.org/lcp/basic-profile","user_key":{"algorithm":"http://www.w3.org/2001/04/xmlenc#sha256","key_check":"jJEjUDipHK3OjGt6kFq7dcOLZuicQFUYwQ+TYkAIWKm6Xv6kpHFhF7LOkUK/Owww","text_hint":"Enter your email address"}},"id":"ef15e740-697f-11e3-949a-0800200c9a66","issued":"2013-11-04T01:08:15+01:00","links":[{"rel":"hint","href":"https://www.imaginaryebookretailer.com/lcp/hint","type":"text/html"}],"provider":"https://www.imaginaryebookretailer.com","updated":"2014-02-21T09:44:17+01:00","user":{"id":"d9f298a7-7f34-49e7-8aae-4378ecb1d597"}}
```

Using the signature algorithm required by the Encryption Profile, a Content Provider must first hash the License Document, giving the following byte sequence, represented here in hexadecimal:

```json
23c68442c7214ba294ddd1a2902756e9fe575116a88f36e55baf94590a90c2ad
```

This SHA-256 form must then be signed using the Content Provider’s Private Key, giving the following result, in Base 64:

```json
q/3IInic9c/EaJHyG1Kkqk5v1zlJNsiQBmxz4lykhyD3dA2jg2ZzrOenYU9GxP/xhe5H5Kt2WaJ/hnt8+GWrEx1QOwnNEij5CmIpZ63yRNKnFS5rSRnDMYmQT/fkUYco7BUi7MPPU6OFf4+kaToNWl8m/ZlMxDcS3BZnVhSEKzUNQn1f2y3sUcXjes7wHbImDc6dRthbL/E+assh5HEqakrDuA4lM8XNfukEYQJnivqhqMLOGM33RnS5nZKrPPK/c2F/vGjJffSrlX3W3Jlds0/MZ6wtVeKIugR06c56V6+qKsnMLAQJaeOxxBXmbFdAEyplP9irn4D9tQZKqbbMIw==
```


With this signature and the certificate, a valid license <b>MAY</b> be created:

```json
{
  "date": "2013-11-04T01:08:15+01:00",
  "encryption": {
    "content_key": {
      "algorithm": "http://www.w3.org/2001/04/xmlenc#aes256-cbc",
      "encrypted_value": "/k8RpXqf4E2WEunCp76E8PjhS051NXwAXeTD1ioazYxCRGvHLAck/KQ3cCh5JxDmCK0nRLyAxs1X0aA3z55boQ=="
    },
    "profile": "http://readium.org/lcp/basic-profile",
    "user_key": {
      "algorithm": "http://www.w3.org/2001/04/xmlenc#sha256",
      "text_hint": "Enter your email address"
    }
  },
  "id": "ef15e740-697f-11e3-949a-0800200c9a66",
  "links": [
    { "rel": "hint",
      "href": "https://www.imaginaryebookretailer.com/lcp/hint",
      "type": "text/html"
    }
  ],  
  "user": {"id": "d9f298a7-7f34-49e7-8aae-4378ecb1d597"},
  "signature": {
    "algorithm": "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256",
    "certificate": "MIIDEjCCAfoCCQDwMOjkYYOjPjANBgkqhkiG9w0BAQUFADBLMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTETMBEGA1UEBxMKRXZlcnl3aGVyZTESMBAGA1UEAxMJbG9jYWxob3N0MB4XDTE0MDEwMjIxMjYxNloXDTE1MDEwMjIxMjYxNlowSzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExEzARBgNVBAcTCkV2ZXJ5d2hlcmUxEjAQBgNVBAMTCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOpCRECG7icpf0H37kuAM7s42oqggBoikoTpo5yapy+s5eFSp8HSqwhIYgZ4SghNLkj3e652SALav7chyZ2vWvitZycY+aq50n5UTTxDvdwsC5ZNeTycuzVWZALKGhV7VUPEhtWZNm0gruntronNa8l2WS0aF7P5SbhJ65SDQGprFFaYOSyN6550P3kqaAO7tDddcA1cmuIIDRf8tOIIeMkBFk1Qf+lh+3uRP2wztOTECSMRxX/hIkCe5DRFDK2MuDUyc/iY8IbY0hMFFGw5J7MWOwZLBOaZHX+Lf5lOYByPbMH78O0dda6T+tLYAVzsmJdHJFtaRguCaJVtSXKQUAMCAwEAATANBgkqhkiG9w0BAQUFAAOCAQEAi9HIM+FMfqXsRUY0rGxLlw403f3YtAG/ohzt5i8DKiKUG3YAnwRbL/VzXLZaHru7XBC40wmKefKqoA0RHyNEddXgtY/aXzOlfTvp+xirop+D4DwJIbaj8/wHKWYGBucA/VgGY7JeSYYTUSuz2RoYtjPNRELIXN8A+D+nkJ3dxdFQ6jFfVfahN3nCIgRqRIOt1KaNI39CShccCaWJ5DeSASLXLPcEjrTi/pyDzC4kLF0VjHYlKT7lq5RkMO6GeC+7YFvJtAyssM2nqunA2lUgyQHb1q4Ih/dcYOACubtBwW0ITpHz8N7eO+r1dtH/BF4yxeWl6p5kGLvuPXNU21ThgA==",
    "value": "q/3IInic9c/EaJHyG1Kkqk5v1zlJNsiQBmxz4lykhyD3dA2jg2ZzrOenYU9GxP/xhe5H5Kt2WaJ/hnt8+GWrEx1QOwnNEij5CmIpZ63yRNKnFS5rSRnDMYmQT/fkUYco7BUi7MPPU6OFf4+kaToNWl8m/ZlMxDcS3BZnVhSEKzUNQn1f2y3sUcXjes7wHbImDc6dRthbL/E+assh5HEqakrDuA4lM8XNfukEYQJnivqhqMLOGM33RnS5nZKrPPK/c2F/vGjJffSrlX3W3Jlds0/MZ6wtVeKIugR06c56V6+qKsnMLAQJaeOxxBXmbFdAEyplP9irn4D9tQZKqbbMIw=="
  }
}
```


## 5.5. Validating the certificate and signature

#### **5.5.1. Validating the certificate**

1. It <b>MUST</b> check that the Certificate was not expired when the License Document was last updated.

2. It <b>MUST</b> validate the presence of the Provider Certificate in the root chain. To do so, it <b>MUST</b> check the signature of the Provider Certificate using the public key of the Root Certificate.

3. It <b>MUST</b> validate that the certificate was not revoked as defined in [[X509](#normative-references)]. If a network connection is available, it <b>MUST</b> update its certificate revocation list before it checks the validity of the certificate.

#### **5.5.2. Validating the signature**

In order to validate the signature, the following steps <b>MUST</b> be followed in order:

1. The Reading System <b>MUST</b> extract and remove the signature from the License Document. 

2. It <b>MUST</b> calculate the canonical form of the License Document following the rules as expressed in [5.3. Canonical form of the License Document](#canonical-form-of-the-license-document).

3. It <b>MUST</b> recalculate the signature as defined in [5.4. Generating the signature](#generating-the-signature).

4. It <b>MUST</b> verify that the calculated signature value is consistent with the one previously extracted from the License Document.

# 6. Encryption Profiles

## 6.1. Introduction

{:.information}
**This section is informative**

LCP is entirely based on standard encryption algorithms, as defined in [[XML-ENC](#normative-references)] and [[XML-SIG](#normative-references)]. In order to maintain maximum flexibility, no specific algorithms are mandated by this specification. Instead, the design of both `encryption.xml` and the License Document allow for the identification of encryption algorithms to be discovered by Reading Systems when presented with a Protected Publication.

In order to simplify this discovery process, the LCP 1.0 specification defines an Encryption Profile, which is the set of encryption algorithms used in a specific Protected Publication and associated Licence Document. Reading Systems that implement the algorithms identified in the Encryption Profile will be able to decrypt Protected Publications encoded using that Encryption Profile. For ease of discovery, the Encryption Profile is identified in the License Document.

This specification defines the Basic Encryption Profile 1.0, along with a list of associated algorithms extracted from [[XML-ENC](#normative-references)] or [[XML-SIG](#normative-references)]. All future official or vendor-specific extensions will also define such an Encryption Profile for easy identification by Reading Systems and publish such profiles in the [LCP Encryption Profiles Registry](#informative-references).

## 6.2. Encryption Profile Requirements

All Encryption Profiles <b>MUST</b> identify algorithms for the following targets:  

1. Publication Resources

2. Content Key and User fields (if encrypted)

3. User Passphrase

4. Signature

All algorithms used in an Encryption Profile <b>MUST</b> be defined in [[XML-ENC](#normative-references)] or [[XML-SIG](#normative-references)].

All Encryption Profiles <b>MUST</b> use a URI to identify themselves in `profile` (contained in the `encryption` object of the License Document).

All Encryption Profiles <b>MUST</b> be registered in the LCP Encryption Profiles registry, as explicitly explained in the registry.

## 6.3. Basic Encryption Profile 1.0

Basic Encryption Profile 1.0 is officially identified in the `encryption` object of the License Document using the URL `http://readium.org/lcp/basic-profile` for the `profile` attribute value.

The following algorithms are associated to the Basic Encryption Profile 1.0:

<table class="table-bordered large">
  <tr>
    <th>Encryption target</th>
    <th>Algorithm (name)</th>
    <th>Algorithm (URI)</th>
    <th>Identified in</th>
  </tr>
  <tr>
    <td>Publication Resources</td>
    <td>AES 256 bits CBC</td>
    <td>http://www.w3.org/2001/04/xmlenc#aes256-cbc</td>
    <td>encryption.xml</td>
  </tr>
  <tr>
    <td>Content Key, User fields (if encrypted)</td>
    <td>AES 256 bits CBC</td>
    <td>http://www.w3.org/2001/04/xmlenc#aes256-cbc</td>
    <td>License Document</td>
  </tr>
  <tr>
    <td>User Passphrase</td>
    <td>SHA-256</td>
    <td>http://www.w3.org/2001/04/xmlenc#sha256</td>
    <td>License Document</td>
  </tr>
  <tr>
    <td>Signature</td>
    <td>RSA with SHA-256</td>
    <td>http://www.w3.org/2001/04/xmldsig-more#rsa-sha256
</td>
    <td>License Document</td>
  </tr>
</table>


# 7. Reading System Behavior

## 7.1 Detecting LCP Protected Publications

Reading Systems can detect that a Publication is protected using LCP by either of these means:

1. The presence of the License Document (`META-INF/license.lcpl`)

2. The presence of a `ds:KeyInfo/ds:RetrievalMethod` element in `META-INF/encryption.xml` that references an LCP Content Key (i.e., `Type` attribute value is "`http://readium.org/2014/01/lcp#EncryptedContentKey`" )

If `encryption.xml` references an LCP Content Key but the License Document is missing, the Reading System <b>SHOULD</b> report this to the User.

## 7.2. License Document processing

### Overall

In processing a License Document, Reading Systems <b>MUST</b> ignore all name/value pairs they do not understand.

Reading Systems <b>MUST NOT</b> store unencrypted versions of the Content Key and/or encrypted user fields.

### Validating the License Document

Reading Systems <b>MUST</b>:

1. Validate the syntax and completeness of the License Document.

2. Validate the signature as defined in [5.5. Validating the certificate and signature](#validating-the-certificate-and-signature).

### Acquiring the Publication

When License Documents are delivered independently of the Protected Publication, Reading Systems <b>MUST</b>:

1. Download the Protected Publication at the given URL given in `links/publication/href`.

A Reading System that will make the Protected Publication file accessible to the User <b>MUST</b> add the License Document to the downloaded Protected Publication at `META-INF/license.lcpl`.

Reading Systems <b>SHOULD</b> verify the integrity of the downloaded Protected Publication, if a hash is provided.

A Reading System <b>SHOULD</b> report any failure to acquire the Protected Publication to the user.

## 7.3. User Key processing

Reading Systems <b>MUST</b>:

* Show the text hint and URL when prompting the User for their User Passphrase

Reading Systems <b>SHOULD</b>:

* Store the User Key, but in a secured manner

* Try previously stored User Keys before prompting the User to enter their User Passphrase for a new Protected Publication

Reading Systems <b>MAY</b>:

* Use an alternate technique to discover and exchange the User Key in the background.

* Associate specific User Keys with specific Providers and User IDs in order to optimize the discovery of the correct User Key to process a License Document.

Reading Systems <b>MUST NOT</b>:

* Store User Passphrase, only the User Key.

## 7.4. Signature Processing

Reading Systems <b>MUST</b>:

* Validate the Signature and Provider Certificate as described in [5.5. Validating the certificate and signature](#validating-the-certificate-and-signature).

* Update the Certification Revocation List on a regular basis.

Reading Systems <b>SHOULD</b>:

* Be able to update their Root Certificate.

Reading Systems <b>MAY</b>:

* Choose to open a Publication even if their own Root Certificate is deprecated.

Reading Systems <b>MUST NOT</b>:

* Open a Publication with an invalid Signature or Provider Certificate.

* Block a User from opening a Publication if a network connection is unavailable or the Certificate Revocation List can't be reached.

## 7.5. Publication Processing

Reading Systems <b>MUST</b>:

* Respect all rights limitations given in the License Document.

Reading Systems <b>MAY</b>:

* Delete a Protected Publication if its License expired.

Reading Systems <b>MUST NOT</b>:

* Store unencrypted Publication Resources.

# Normative references

[JSON] [The application/json Media Type for JavaScript Object Notation (JSON)](https://www.ietf.org/rfc/rfc4627).

[JSON Pointer] [JavaScript Object Notation (JSON) Pointer](https://tools.ietf.org/html/rfc6901).

[OCF] [Open Container Format 3.0.1](https://www.idpf.org/epub/301/spec/epub-ocf.html).

[Publications] [EPUB Publications 3.0.1](https://www.idpf.org/epub/301/spec/epub-publications.html).

[X509] [Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile](https://tools.ietf.org/html/rfc5280).

[XML-ENC] [XML Encryption Syntax and Processing Version 1.1](https://www.w3.org/TR/xmlenc-core1/).

[XML-SIG] [XML Signature Syntax and Processing (Second Edition)](https://www.w3.org/TR/xmldsig-core/).

[URI-Template] [URI Template](https://tools.ietf.org/html/rfc6570).

[RFC2119] [Key words for use in RFCs to Indicate Requirement Levels](https://tools.ietf.org/html/rfc2119).

# Informative references

LCP Link Relations Registry

LCP Rights Registry

LCP User Fields Registry

LCP Encryption Profiles Registry



