---
title: Prepare Quarantined Workspaces
---

This section is meant to be done immediately before executing the Deposit or
Withdrawal protocols. If you are executing the Setup Protocol for the
first time and do **not** plan on executing the Deposit or Withdrawal protocol now, you can stop here.

1. Block side channels:

    [Side-channel attacks](https://en.wikipedia.org/wiki/Side-channel_attack)
    are a form of electronic threat based on the physical nature of computing
    hardware (as opposed to algorithms or their software implementations).
    Side channel attacks are rare, but it's relatively straightforward to
    defend against most of them.
    1. Visual side channel:
        1. Ensure that no humans or cameras (e.g. home security cameras, which
        can be hacked) have visual line-of-sight to the Quarantined Computers.
        1. Close doors and window shades.
    1. [Acoustic side channel](https://en.wikipedia.org/wiki/Acoustic_cryptanalysis):
        1. Choose a room where sound will not travel easily outside.
        1. Shut down nearby devices with microphones (e.g. smartphones and
        other laptops).
        1. Plug in and turn on a table fan to generate white noise.
    1. [Power side channel](http://sharps.org/wp-content/uploads/CLARK-ESORICS13.pdf):
        1. Unplug both Quarantined Computers from the wall.
        1. Run them **only on battery power** throughout this protocol.
        1. Make sure they are fully charged first! If you run out of battery,
        you'll need to start over.
    1. [Radio](https://cyber.bgu.ac.il/how-leak-sensitive-data-isolated-computer-air-gap-near-mobile-phone-airhopper/)
    and other side channels. Including
    [seismic](https://www.cc.gatech.edu/fac/traynor/papers/traynor-ccs11.pdf),
    [thermal](https://cyber.bgu.ac.il/bitwhisper-heat-air-gap/),
    and [magnetic](http://fc15.ifca.ai/preproceedings/paper_14.pdf):
        1. Turn off all other computers and smartphones in the room.
        1. Put portable computing devices in the Faraday bag and seal the bag.
        1. Unplug desktop computers.
1. Put your <span class="qboot">Q1 BOOT</span> USB into an open slot in your Q1 computer.
1. Boot off the USB drive. If you've forgotten how, refer to the procedure in [ Section IV of the Setup Protocol](../../setup/create-boot-usb/).
1. Plug the <span class="qapp">Q1 APP</span> USB into the Q1 computer.
1. Copy the software from the Q1 computer's RAM disk:
    1. Click the File Manager icon from the launchpad on the left side of the
    screen.
    1. Click on the App USB on the left of the file manager.
    1. Drag the contents of the USB to the "Home" directory on the left side of
    file manager.
1. Open a copy of this document on the Q1 computer:
    1. In the File Manager find the glacier folder, the PDF file for this
    document should be visible with the name "Glacier.pdf." Open it.

        Note: You won't be able to click any external links in the document, since you don't have a network connection. If you need to look something up on the internet, do so in a distant room. Do not remove devices from the Faraday bag before doing going to the other room.

1. Open a Terminal window by pressing Ctrl-Alt-T.
1. Install the application software on the Q1 computer's RAM disk:
    1. Install applications from the `apps` folder:
        ```
        $ cd ~/apps
        $ sudo dpkg -i *.deb
        ```

    1. Install Bitcoin Core:
        1. Run commands to import and verify the Bitcoin Core release:
            ```
            $ cd ~/bitcoin
            $ gpg --import jon@atack.com
            $ gpg --verify SHA256SUMS.asc
            ```
            
        
        1. The output will include a lot of text, but ensure you see this:
            ```
            gpg: Good signature from "Jon Atack <jon@atack.com>" [unknown]
            gpg:                 aka "jonatack <jon@atack.com>" [unknown]
            gpg: WARNING: This key is not certified with a trusted signature!
            gpg:          There is no indication that the signature belongs to the owner.
            Primary key fingerprint: 8292 1A4B 88FD 454B 7EB8  CE3C 796C 4109 063D 4EAF
            ```

        1. Verify the fingerprints in the fingerprint file match the fingerprint
        of the downloaded file:
            ```
            $ sha256sum -c --ignore-missing SHA256SUMS
            ```
        The following output should be displayed:
            ```
            bitcoin-22.0-x86_64-linux-gnu.tar.gz: OK
            ```
        1. Extract the bitcoin core archive:
            ```
            $ tar xf bitcoin-22.0-x86_64-linux-gnu.tar.gz
            ```
        1. Export the path to the Bitcoin Core binaries:
            ```
            $ export PATH=$PATH:$HOME/bitcoin/bitcoin-22.0/bin
            ```
        1. Double check the `bitcoin-cli` command:
            ```
            $ which bitcoin-cli
            ```
        Should return:
            ```
            /home/ubuntu/bitcoin/bitcoin-22.0/bin/bitcoin-cli
            ```
1. Change into the glacier directory. You'll be using this directory to execute
software for the protocol:
    ```
    $ cd ~/glacier
    ```
1. Prepare GlacierScript for execution:
    ```
    $ chmod +x glacierscript.py
    ```
1. Prepare the "Quarantined Scratchpad" -- an empty file you'll use as a place
to jot notes:
    1. Click the "Search your computer" icon at the top of the launcher along
    the left side of the screen.
    1. Type "text editor".
    1. Click the Text Editor icon.
    1. A blank window should appear.
1. Repeat the above steps using the Q2 computer, <span class="qboot">Q2 BOOT</span> USB and <span class="qapp">Q2 APP</span> USB.
