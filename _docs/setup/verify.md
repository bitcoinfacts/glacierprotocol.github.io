---
title: Verify and Print Protocol Document
---

The Setup Protocol is used to prepare hardware, and download and verify needed
software & documentation.

The first thing we need to do is verify the integrity of
the Glacier protocol document (the one you are reading) to ensure that it
has not been tampered with. After verifying the document, we'll print
a hardcopy.

Printing is important, because a verified electronic copy will not be
accessible at all times during protocol execution due to reboots and other
changes to the computing environment. Printing a hardcopy ensures there is
always a verified copy of the document available.

1. Find a computer which has Internet access, printer access, and which you have
permission to install new software on. We'll refer to this computer as the
"SETUP 1" computer.
1. Review the errata for the version of Glacier you are using at <https://github.com/bitcoinfacts/GlacierProtocol/releases>.
1. Download the latest full release of Glacier (*not* just the protocol document)
at <https://github.com/bitcoinfacts/GlacierProtocol/releases/latest>.
1. If your browser does not automatically extract the ZIP file contents into a
folder within your downloads directory, do so.
1. Rename the folder to "glacier."
1. If you have used Glacier before, *and* you know you have the Glacier public key
imported into a local GPG keyring, skip the next step. (If you don't know,
that's fine; proceed as normal.)
1. Obtain the Glacier "public key," used to cryptographically verify the protocol document:
  
    Technical details: Glacier's GPG keys are handled with good security practices. They were generated while booting off an Ubuntu Live USB on a factory-new laptop with the wireless card removed, and transferred via USB to a MacBook. The private key is not stored in the cloud. The public key is hosted separately from our software distributions, on Keybase, secured with separate credentials (all of which are in password managers).

   **If you are ever using Glacier in the future and notice that this step has
   changed (or that this warning has been removed), there is a security risk.**
   Stop and seek assistance.
  
    Technical details: There's a chicken-and-egg problem here, in that this document
  is giving instructions for how to verify itself. Any attacker that compromised
  this document could also compromise these instructions so that the verification
  (erroneously) passes. There's no way to prevent this, unless a reader is familiar
  with the document before the compromise and recognizes that the verification
  instructions have changed. (This is why we don't just include a direct download
  link to the public key -- if an attacker changed the link, it would be easy
  for people not to notice.)
  In the unfortunate event we legitimately need to change the verification
  instructions (i.e. to publish a new public key, or change the means of obtaining
  the existing key), we'll first disseminate a public announcement, signed at a
  minimum with our personal keys, and hopefully with the keys of well-known
  individuals from the Bitcoin community.

    1. Access bitcoinfacts's Keybase profile at <https://keybase.io/bitcoinfacts>.
    1. Click the string of letters and numbers next to the key icon.
    1. In the pop-up that appears, locate the link reading "this key".
    1. Right-click the link and select "Save Link As..." or "Download Linked File
    As..."
    1. Name the file "glacier.asc".
{% if site.platform != "linuxOnly" %}
1. Download and install [GnuPG](https://gnupg.org/), the software we'll use for doing the cryptographic verification. GnuPG is the same software recommended by the Electronic Frontier Foundation's Surveillance Self Defense protocol:

    Technical details: Note that we are foregoing verification of the integrity of
  GnuPG itself. Verification requires having access to a pre-existing, trusted
  installation of GnuPG, and for many Glacier users, this will not be easy to
  come by. If you do have access to a trusted installation of GnuPG, and
  understand how to do the verification process, we encourage you to do so.
  The risk of an unverified PGP installation is relatively small, since an
  attacker would have to compromise not just the hosting of GPG distributions,
  but also the hosting of other software distributions used by Glacier, and such
  a breach would be quickly detected by the global community.

    1. **Windows**: Download and install the latest available version of
    [Gpg4win](https://www.gpg4win.org/). Use the default
    options.
    1. **macOS**: Download and install the latest available version of
    [GPG Suite](https://gpgtools.org/).
    1. **Linux**: GnuPG comes pre-installed with Linux distributions.
{% endif %}
1. Open a terminal window:
{% if site.platform != "linuxOnly" %}
    1. **Windows**: Press Windows-R, type "powershell" and click OK.
    1. **macOS**: Click the Searchlight (magnifying glass) icon in the menu bar, and
    type a terminal window. "terminal". Select the Terminal application from the
    search results.{% endif %}
    1. **Linux**: Varies; on Ubuntu, press Ctrl-Alt-T.

1. Change the terminal window's active folder to your downloads folder. The
commands below are based on common default settings; if you put your downloads
is in a different place, you will need to customize this command.
{% if site.platform != "linuxOnly" %}
    1. **Windows**:  `> cd $HOME/Downloads/glacier`
    1. **macOS**:  `$ cd $HOME/Downloads/glacier`{% endif %}
    1. **Linux**: `$ cd $HOME/Downloads/glacier`

1. Verify the integrity of the downloaded document. For technical background about this process, see <https://en.wikipedia.org/wiki/Digital_signature>.

    1. Import the Glacier public key into your local GPG installation:
       ```
       $ gpg --import $HOME/Downloads/glacier.asc
       ```

    1. Use the public key to verify that the Glacier "fingerprint file" is legitimate:
       ```
       $ gpg --verify SHA256SUMS.sig SHA256SUMS
       ```
       Expected output (timestamp will vary, but e-mail and fingerprint should match):
       <pre>
       <span style="font-size: 10px;">gpg: Signature made Fri Feb 10 22:23:45 2017 PST using RSA key ID 4B43EAB0
       gpg: Good signature from "bitcoinfacts <bitcoinfacts1@protonmail.com>" [unknown]
       gpg: WARNING: This key is not certified with a trusted signature!
       gpg:          There is no indication that the signature belongs to the owner.
       Primary key fingerprint: B85C 0836 B6D7 EE69 2354 EBE6 5271 5E71 0749 75D5</span>
       </pre>
       The warning message is expected, and is not cause for alarm.
       
        Technical details: GPG was designed on the premise that public keys would be
       verified as actually belonging to their owners - either directly, by receiving
       a key face-to-face from someone known to you, or indirectly, via cryptographic
       signature by someone whose public key you've already verified. The warning
       message merely indicates that you have done neither of these verifications for
       Glacier's public key.
       This is standard practice with software distribution,
       even for major software packages like Ubuntu.
       Although you do not have the opportunity to personally
       verify Glacier's public key came from the Glacier team, you can nonetheless have
       some degree of trust in the validity of the key, to the extent you trust it was
       generated and is hosted in a secure manner, and that someone in the community
       may have noticed and raised an alarm if it were surreptitiously changed by an
       attacker.
    1. Verify the fingerprints in the fingerprint file match the fingerprints of the
    downloaded Glacier files.

        1. On Linux{% if site.platform != "linuxOnly" %} or Mac{% endif %}:

            Linux: `$ sha256sum -c SHA256SUMS 2>&1`
{% if site.platform != "linuxOnly" %}
            Mac: `$ shasum -a 256 -c SHA256SUMS 2>&1`
{% endif %}
            Expected output:
            ```
            Glacier.pdf: OK
            Glacier-linux-only.pdf: OK
            glacierscript.py: OK
            base58.py: OK
            README.md: OK
            ```
{% if site.platform != "linuxOnly" %}
        1. On Windows 10:

            ```
            > Get-FileHash -a sha256 Glacier.pdf
            > cat SHA256SUMS | select-string -pattern "Glacier.pdf"
            ```
            Ensure that the hash output from the first command matches the output by the
            second command. Upper/lower case doesn't matter.
{% endif %}
    1. If you do not see the expected output, your copy of the document has not been verified. Stop and seek assistance.

1. Switch to use the new document.

    1. Open the version of the document that you just verified.
    1. Close this window (of the unverified version of the document you had been
    using).
    1. Delete the old, unverified copy of the document.

1. Print the verified document.

You are strongly encouraged to use the printed copy as a checklist, physically
marking off each step as you complete it. This reduces the risk of execution
error by ensuring you don't lose your place.
