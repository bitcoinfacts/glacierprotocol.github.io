---
title: Create App USBs
---

We will prepare two (2) "Quarantined App USB"
drives with the software needed to execute the remainder of the protocol.
These are the USB drives you labeled <span class="qapp">Q1 APP</span> and <span class="qapp">Q2 APP</span> in [Section III of the Setup Protocol](../../setup/quarantined-hardware/).

1. Boot the SETUP 1 computer off the <span class="setupboot">SETUP 1 BOOT</span> USB if it is not
already. (See the instructions in [Section IV of the Setup Protocol](../../setup/create-boot-usb/) for details.)
1. Insert the <span class="qapp">Q1 APP</span> USB into the the SETUP 1 computer.

    **The instruction to plug a Quarantined App USB into your Setup computer
    *should* raise a red flag for you, because <span style="color: red;">you should never plug a quarantined
    USB into anything other than the quarantined computer it is designated for!</span>**

    This setup process is the ONE exception.

1. Press Ctrl-Alt-T to open a terminal window.
1. Install the Glacier document and GlacierScript on the <span class="qapp">Q1 APP</span> USB:

    1. Download the latest full release of Glacier (*not* just the protocol
    document) at
    [https://github.com/bitcoinfacts/GlacierProtocol/releases/latest](https://github.com/bitcoinfacts/GlacierProtocol/releases/latest).
    1. Unpack the Glacier ZIP file into a staging area:

        1. When the download starts, Firefox will ask you if you want to open the
        ZIP file with Archive Manager. Click OK. When the ZIP file download completes, it will be opened with Archive Manager.

        1. There will be a single entry in a list named
        "GlacierProtocol-<span class="primary">version-here</span>", where
        <span class="primary">version-here</span> is replaced with
        the current version number (like "v1.0"). Click on that and then click
        the "Extract" button.
        1. The Archive Manager will ask you where you want to extract the ZIP
        file to. Select "Home" on the left panel and then press the extract button.
        1. When the Archive Manager is finished extracting the ZIP archive it
        will ask you what to do next. Click "Show the Files".
        1. Rename the unzipped folder from "GlacierProtocol-<span class="primary">version-here</span>" to
        "glacier".

    1. Obtain the Glacier "public key," used to cryptographically verify the
    Glacier document and GlacierScript:

        **If you are ever using Glacier in the future and notice that this step
        has changed (or that this warning has been removed), there is a
        security risk.** Stop and seek assistance.

        1. Access BitcoinFacts's Keybase profile at <https://keybase.io/bitcoinfacts>.
        1. Click the string of letters and numbers next to the key icon.
        1. In the pop-up that appears, locate the link reading "this key".
        1. Right-click the link and select "Save Link As..."
        1. Name the file "glacier.asc".

    1. Verify the integrity of the Glacier download:

        1. Import the Glacier public key into your local GPG installation:
           ```
           $ gpg --import ~/Downloads/glacier.asc
           ```
        1. Switch to the glacier folder:
           ```
           $ cd ~/glacier
           ```
        1. Use the public key to verify that the Glacier "fingerprint file" is
        legitimate:
           ```
           $ gpg --verify SHA256SUMS.sig SHA256SUMS
           ```
           Expected output (timestamp will vary, but
           e-mail and fingerprint should match):
           <pre>
           <span style="font-size: 10px;">gpg: Signature made Sat Dec 18 12:23:10 2021 PST using RSA key ID B85C0836B6D7EE692354EBE652715E71074975D5
           gpg: Good signature from "bitcoinfacts <bitcoinfacts1@protonmail.com>" [unknown]
           gpg: WARNING: This key is not certified with a trusted signature!
           gpg: There is no indication that the signature belongs to the owner.
           Primary key fingerprint: B85C 0836 B6D7 EE69 2354 EBE6 5271 5E71 0749 75D5</span>
           </pre>

           The warning message is expected, and is not cause for alarm.

        1. Verify the fingerprints in the fingerprint file match the fingerprints
        of the downloaded Glacier files:
           ```
           $ sha256sum -c SHA256SUMS 2>&1
           ```
           Expected output:
           ```
           Glacier.pdf: OK
           Glacier-linux-only.pdf: OK
           glacierscript.py: OK
           base58.py: OK
           README.md: OK
           ```

    1. Copy the "glacier" folder to the <span class="qapp">Q1 APP</span> USB:
        1. Click on the File Manager icon in the launching dock along the left
        side of the screen.
        1. Find the "glacier" folder under "Home".
        1. Click and drag the glacier folder to the icon representing the USB
        drive on the left.
        1. If you see an "Error while copying" pop-up, you may be suffering from
        [this Ubuntu bug](https://bugs.launchpad.net/ubuntu/+source/nautilus/+bug/1021375).
        To fix it, do the following and then retry copying the files:

            1.  
                ```
                $ mv ~/.config/nautilus ~/.config/nautilus-bak
                ```
            1. Log out of Ubuntu: Click the power icon in the top right of the
            screen and select "logout" from the drop-down menu.
            1. Login again with user "ubuntu" and leave the password blank.

1. Open the Glacier Protocol document so that it is available for copy-pasting terminal commands.
1. Install the remaining application software on the <span class="qapp">Q1 APP</span> USB:
    1. Configure the system to enable access to the software we need in Ubuntu's
    "package repository":
        1. ```
        $ sudo apt-add-repository universe
        ```
        1. ```
        $ sudo apt-get update
        ```
    1. Create a folder for the application files that will be moved to the
    USB:
        ```
        $ mkdir ~/apps
        ```
    1. Download and perform integrity verification of software available from Ubuntu's package repository:
        * **qrencode**: Used for creating QR codes to move data off quarantined
        computers
        * **zbar-tools**: Used for reading QR codes to import data into quarantined
        computers
            ```
            $ cd ~/apps
            $ apt download libqrencode3=3.4.4-1build1
            $ apt download libzbar0=0.10+doc-10.1build2
            $ apt download qrencode=3.4.4-1build1
            $ apt download zbar-tools=0.10+doc-10.1build2
            ```
    1.  Copy the contents of the apps folder to the <span class="qapp">Q1 APP</span> USB:
        1. Click on the File Manager icon in the launching dock:
        1. Navigate to the "Home" folder.
        1. Click and drag "apps" folder to the icon representing
        the USB drive on the left panel.
    1. Download [Bitcoin Core](https://bitcoincore.org/), which we'll use for cryptography & financial operations:
        ```
        $ mkdir ~/bitcoin
        $ cd ~/bitcoin
        $ wget https://keys.openpgp.org/vks/v1/by-email/jon@atack.com
        $ wget https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS.asc
        $ wget https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS
        $ wget https://bitcoincore.org/bin/bitcoin-core-22.0/bitcoin-22.0-x86_64-linux-gnu.tar.gz
        ```
    Then drag the "bitcoin" folder to the <span class="qapp">Q1 APP</span> USB.
1. Click on the USB drive icon to verify that it has the correct files. The
contents should look like this:
    ```
    apps
    glacier
    bitcoin
    ```

    Click the `apps` folder. It will have the following content.
    Note that the version number of the Bitcoin package may change as new
    versions are released. Future versions of Glacier may pin to a specific
    version.

    ```
    qrencode_3.4.4-1_amd64.deb
    libqrencode3_3.4.4-1_amd64.deb
    zbar-tools_0.10+doc-10ubuntu1_amd64.deb
    libzbar0_0.10+doc-10ubuntu1_amd64.deb
    ```

    Click the `bitcoin` folder. It will have the following content:
    ```
    jon@atack.com
    SHA256SUMS
    SHA256SUMS.asc
    bitcoin-22.0-x86_64-linux-gnu.tar.gz
    ```

    Click the `glacier` folder. It will have the following content:
    ```
    t
    glacierscript.py
    base58.py
    SHA256SUMS.sig
    SHA256SUMS
    README.md
    Makefile
    LICENSE
    Glacier.pdf
    Glacier-linux-only.pdf
    .gitignore
    ```
1. Eject and physically remove the <span class="qapp">Q1 APP</span> USB from the SETUP 1 computer.

    **The <span class="qapp">Q1 APP</span> USB is now eternally quarantined. It should never again be
    plugged into anything besides the Q1 computer.**

1. Repeat all above steps using the SETUP 2 computer, <span class="setupboot">SETUP 2 BOOT</span> USB, and <span class="qapp">Q2 APP</span> USB.
1. Find a container in which to store all of your labeled hardware, along
with the Glacier document hardcopy, when you are finished.
