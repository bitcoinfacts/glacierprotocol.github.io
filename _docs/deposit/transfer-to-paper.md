---
title: Transfer Cold Storage Data To Paper
---

In this section, you'll move the cold storage data you generated in [Section I](../../deposit/generate-cold-storage-data/) of the Deposit Protocol from the quarantined computing environments onto physical paper. This will be
done using a combination hand transcription and
[QR codes](https://en.wikipedia.org/wiki/QR_code).

1. Transfer the <span class="danger">private keys</span> to paper:
    1. Write each <span class="danger">private key</span> on a **separate** piece
    of TerraSlate paper (**one** key per page).
        1. Do **not** write anything else on the paper unless specifically
        instructed (such as "Bitcoin", "Glacier", "private key", etc.) In the
        event the key is seen by someone untrustworthy or stolen by a random
        thief, such clues help them understand the significance of the key and
        give them an incentive to plot further thefts or attacks.
        1. Transcribe **by hand**. Do not use QR codes or any other method to transfer.
        1. Private keys **are** case-sensitive.
        1. **Write clearly**.
            1. Use care when transcribing "o" (lower-case "o"). Note that
            private keys do **not** contain "O" (upper-case "o") or "0" (number zero).
            1. Use care when transcribing "1" (number one). Note that private
            keys do **not** contain "I" (uper case "i") or "l" (lower-case "L")
            1. Use care to distinguish between "t" and "+" (private keys do
            not contain plus signs)
            1. Use care to distinguish between "2" and "Z"
            1. Use care to distinguish between "5" and "S"
            1. Use care to distinguish between "6" and "b"
            1. Use care to distinguish between "6" and "G"
            1. Use care to distinguish between "K" and "k"
            1. Use care to distinguish between "5" and "S"
            1. Use care to distinguish between "u" and "v"
            1. Use care to distinguish between "U" and "v"
    1. **Double-check that you transcribed all
    <span class="danger">private keys</span> correctly.** If you make a mistake,
    you'll have to redo a lot of work.
    1. Label each page with:
        1. Today's date
        1. The version of Glacier used (listed on the front page of this document)
1. Visually hide all critically sensitive data:

    We'll be using a smartphone with a live Internet connection to read QR
    codes from the quarantined computer screens. Any malware (or a malicious
    QR reader app) could steal sensitive data if it is not visually hidden.

    **<span style="color: red;">This step is important. Failing to execute it properly creates a substantial
    security risk.</span>**

    1. Put your <span class="danger">handwritten private keys</span> out of
    sight (don't just turn them face down; paper is not completely opaque).
    This prevents a smartphone camera from accidentally seeing them.
    1. Delete all text from the Quarantined Scratchpad on the **Q1 and Q2**
    computers.
    1. **On the Q1 computer:**
        1. Type "COLD STORAGE ADDRESS" into the Quarantined Scratchpad.
        1. Copy-paste the <span class="warning">cold storage address</span>
        from the terminal window to the Quarantined Scratchpad.
        1. Type "REDEMPTION SCRIPT" into the Quarantined Scratchpad.
        1. Copy-paste the <danger class="warning">redemption script</danger>
        from the terminal window to the Quarantined Scratchpad.
        1. Enable line wrapping so the entire <span class="warning">redemption
        script</span> can be seen:
            1. With the Quarantined Scratchpad window active, go to the menu
            bar at the top of the screen.
            1. Select Edit.
            1. Select Preferences.
            1. Select the View tab.
            1. Uncheck "Do not split words over two lines".
    1. Clear the terminal windows on the **Q1 and Q2** computers:
       ```
       $ clear
       ```
1. QR reader setup:
    1. Remove a smartphone from the Faraday bag and turn it on.
    1. If the smartphone doesn't already have a QR code reader on it, install one.

    Any reader is fine as long as it can read all types of QR codes, but
    here are recommendations we've tested with Glacier:
    [iOS](https://itunes.apple.com/us/app/qr-reader-for-iphone/id368494609?mt=8),
    [Android](https://play.google.com/store/apps/details?id=com.application_4u.qrcode.barcode.scanner.reader.flashlight&hl=en).

1. Transfer the <span class="warning">cold storage address</span> to a
non-quarantined computer:
    1. **On the Q1 computer**, display the
    <span class="warning">cold storage address</span> as a
    <span class="warning">QR code</span> on the screen:
        1. In File Manager, navigate to the "Home" folder, then the "glacier"
        folder, and double-click "address.png".
    1. Use the smartphone's QR code reader to read the <span class="warning">QR
    code</span>. When the <span class="warning">QR code</span> is
    successfully read, the smartphone should display the text
    <span class="warning">cold storage address</span>.
    1. Verify the <span class="warning">cold storage</span> address on the
    smartphone matches the <span class="warning">cold storage address</span> in the Quarantined Scratchpad.

        **If it does not match, do not proceed**. Try using a different QR reader application or restarting the Deposit Protocol. Seek assistance if discrepancies persist.

    1. Use the smartphone to send the
    <span class="warning">cold storage address</span> to yourself using a
    messaging app which you'll be able to access from a laptop.
    (E-mail is not recommended for security reasons.)

1. Repeat the previous step for the
<span class="warning">redemption script</span>, stored in "redemption.png."

    When comparing the <span class="warning">redemption script</span> shown on the smartphone to the
    <span class="warning">redemption script</span> in the Quarantined Scratchpad, it's sufficient to check
    the first 8 characters, the last 8 characters, and a handful of characters
    somewhere in the middle.

1. Power down the smartphone and return it to the Faraday bag.
1. Shut down **both** quarantined computers entirely. As a precaution against
side channel attacks, the quarantined computers should not be active except
when they absolutely need to be.
    ```
    $ sudo shutdown now
    ```
    The recommended Acer laptop may require you to hold down the power button for
    several seconds to complete the shutdown.
1. Create <span class="warning">Cold Storage Information Pages</span>:

   **Using any Internet-connected computer:**
    1. Access the copies of the <span class="warning">cold storage address</span>
    and <span class="warning">redemption script</span> you sent yourself from
    your smartphone previously.
    1. Open an empty document in any text editing application. This will be used
    to create the <span class="warning">Cold Storage Information Page</span>.
    1. Put the following information into the document:
        1. Copy-paste the <span class="warning">cold storage address</span>.
        1. Copy-paste the <span class="warning">redemption script</span>.
        1. Type today's date.
        1. Type the version of Glacier used (listed on the first page of this document)
    1. Do **not** put anything else in the document (such as "Bitcoin",
        "Glacier", "private key", etc.)
    1. Save an electronic copy of the <span class="warning">Cold Storage
        Information Page</span> in a "conventionally secure" location of your choosing,
        such as a "Secure Note" in [1Password](https://1password.com/) or a comparable password
        manager. Because the Cold Storage Information Page contains
        moderately-sensitive data, there are some privacy considerations with keeping and
        electronic copy of it. See the Sensitive Data subsection for details.
    1. Print *N* copies of the
        <span class="warning">Cold Storage Information Page</span>.
    1. Shut down the computer. (It has a camera, and you will be working with
        critically sensitive data in a moment.)
1. Prepare <span class="danger">Cold Storage Information Packets</span>
    1. Put each <span class="danger">handwritten private key page</span> along
    with one <span class="warning">Cold Storage Information Page</span> in its own
    opaque envelope. While this obviously won't deter a determined
    thief, it makes it quite difficult for a thief to steal a key without leaving
    evidence they have done so -- and noticing theft of a single key gives you a
    chance to move your funds away before the thief can steal a second key.
    1. Each pair of pages will be referred to as a
    <span class="danger">Cold Storage Information Packet</span>.
    1. Put your <span class="danger">Cold Storage Information Packets</span>
    somewhere out of sight for the moment.
