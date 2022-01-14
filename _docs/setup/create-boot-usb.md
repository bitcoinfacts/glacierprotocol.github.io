---
title: Create Boot USBs
---

Because the eternally quarantined computers cannot connect to a network, they
cannot download software. We'll be using USB drives to transfer the necessary
software to them.

We will prepare four bootable
[Ubuntu](https://en.wikipedia.org/wiki/Ubuntu_(operating_system))
USB drives. ("Bootable" means that the Ubuntu operating system will be booted
directly from the USB drive, without using the computer's hard drive in any
way.)

The *first two* USB drives ("Setup Boot USBs") are the USB drives you labeled
<span class="setupboot">SETUP 1 BOOT</span> and <span class="setupboot">SETUP 2 BOOT</span> in [Section II of the Setup Protocol](../../setup/non-quarantined-hardware). They will be prepared using
your Setup Computers{% if site.platform != "linuxOnly" %}, which may be running Windows, macOS, or something else{% endif %}.

The *last two* USB drives ("Quarantined Boot USBs") are the USB drives you
labeled <span class="qboot">Q1 BOOT</span> and <span class="qboot">Q2 BOOT</span> in [Section III of the Setup Protocol](../../setup/quarantined-hardware). They will be prepared using your
Setup Computers *while booted off* a *Setup Boot USB* which is running Ubuntu.

Technical details: The Non-Quarantined OS USBs serve two purposes:

* First, they are used for creating the Quarantined App USBs in the next
section, which greatly simplifies the process of doing so because we know
it'll always be done from an Ubuntu environment. (We can't use the
Quarantined OS USBs for this -- they're eternally quarantined, so they need to
be permanently unplugged from their Setup Computer the moment they are created.)
* Second, it will be harder for any malware infections on a Setup Computer's
default OS to undermine a Quarantined USB setup process (the malware would
first have to propagate itself to the Non-Quarantined OS USB).

Perform the following steps on your SETUP 1 computer:
   1. If you are not already reading this document on the SETUP 1 computer, open a
copy there.
   1. Open a terminal window:
{% if site.platform != "linuxOnly" %}
      1. **Windows**: Press Windows-R, type "powershell" and click OK.
      1. **macOS**: Click the Searchlight (magnifying glass) icon in the menu bar, and type "terminal". Select the Terminal application from the search results.{% endif %}
      1. **Linux**: Varies; on Ubuntu, press Ctrl-Alt-T.
   1. Change the terminal window’s active folder to the Downloads folder:
{% if site.platform != "linuxOnly" %}
      1. **Windows**: `> cd $HOME/Downloads`
      1. **macOS**: `$ cd $HOME/Downloads`{% endif %}
      1. **Linux**: `$ cd $HOME/Downloads`
1. Download Ubuntu:
    ```
    $ wget https://releases.ubuntu.com/18.04/ubuntu-18.04.6-desktop-amd64.iso
    ```
    Wait until the download is complete.

1. Verify the integrity of the Ubuntu download:

    1. Change the terminal window's active folder to the folder where you
    downloaded Ubuntu, customizing the folder name if necessary:
{% if site.platform != "linuxOnly" %}
        1. **Windows**: `> cd $HOME/Downloads`
        1. **macOS**: `$ cd $HOME/Downloads`{% endif %}
        1. **Linux**: `$ cd $HOME/Downloads`

    1. View the fingerprint of the file:
{% if site.platform != "linuxOnly" %}
        1. **Windows**: `> Get-FileHash -a sha256 ubuntu-18.04.6-desktop-amd64.iso`
        1. **macOS**: `$ shasum -a 256 ubuntu-18.04.6-desktop-amd64.iso`{% endif %}
        1. **Linux**: `$ sha256sum ubuntu-18.04.6-desktop-amd64.iso`

    1. The following fingerprint should be displayed:

        ```
        f730be589aa1ba923ebe6eca573fa66d09ba14c4c104da2c329df652d42aff11
        ```

        It's not important to check every single character when visually
        verifying a fingerprint. It's sufficient to check the **first 8
        characters, last 8 characters, and a few somewhere in the middle.**

        Technical details: Because you verified the checksum & checksum
        signature for this document in [Section I of the Setup Protocol](../../setup/verify/), we are omitting the GPG
        verification of some other fingerprints in the protocol. For a detailed
        security analysis, see the design document.

        You can verify this is the official Ubuntu fingerprint
        [here](https://old-releases.ubuntu.com/releases/18.04.6/SHA256SUMS),
        or follow Ubuntu's full verification process using this guide.

1. Create the <span class="setupboot">SETUP 1 BOOT</span> USB:
{% if site.platform != "linuxOnly" %}
    1. **Windows**
        1. Download the
        [Rufus disk utility](https://rufus.akeo.ie/)
        and run it.
        1. Insert the <span class="setupboot">SETUP 1 BOOT</span> USB in an empty USB slot.
        1. In the "Device" dropdown at the top of the Rufus window, ensure the
        empty USB drive is selected.
        1. Next to the text "Create a bootable disk using", select "ISO Image"
        in the dropdown.
        1. Click the CD icon next to the "ISO Image" dropdown.
        1. A file explorer will pop up. Select `ubuntu-18.04.6-desktop-amd64.iso`
        from your downloads folder and click Open.
        1. Click Start.
        1. If prompted to download Syslinux software, click "Yes".
        1. When asked to write in "ISO Image Mode (Recommended)" or
        "DD Image Mode", select "ISO Image Mode" and press OK.
        1.  The program will take a few minutes to write the USB.

    1. **macOS**
        1. Prepare the Ubuntu download for copying to the USB:
            ```
            $ cd $HOME/Downloads
            $ hdiutil convert ubuntu-18.04.6-desktop-amd64.iso -format UDRW -o ubuntu-18.04.6-desktop-amd64.img
            ```
        1. Determine the macOS "device identifier" for the Boot USB.
            1. `$ diskutil list`
            1. Insert the <span class="setupboot">SETUP 1 BOOT</span> USB in an empty USB slot.
            1. Wait 10 seconds for the operating system to recognize the USB.
            1. Once more: `$ diskutil list`
            1. The output of the second command should include an additional
            section that was not present in the first command's output.
                1. This section will have (external, physical) in the header.
                1. The first line of the section's SIZE column should reflect
                the capacity of the USB drive.
            1. Make a note of the device identifier.
                1. The device identifier is the part of the new section header
                that comes before (external, physical) (for example /dev/disk2).

        1. Put Ubuntu on the <span class="setupboot">SETUP 1 BOOT</span> USB:
            1. First, unmount the USB:
               <pre>
               $ diskutil unmountDisk <span class="primary">USB-device-identifier-here</span>
               </pre>
            1. Enter the following command, **making sure to use the correct
            device identifier; <span style="color: red;">using the wrong one could overwrite your hard
            drive!</span>**
               <pre>
               $ sudo dd if=ubuntu-18.04.6-desktop-amd64.img.dmg \
               of=<span class="primary">USB-device-identifier-here</span> bs=1m
               </pre>
               Example:
               ```
               $ sudo dd if=ubuntu-18.04.6-desktop-amd64.img.dmg of=/dev/disk2 bs=1m
               ```
            1. Enter your administrator password when requested.
            1. Wait several minutes for the copying process to complete. When
            it does, you may see an error box pop up. This is expected; it's
            because the USB is written in a format readable by Ubuntu, but not
            readable by macOS.
            1. Click Ignore.

        1. Verify the integrity of the <span class="setupboot">SETUP 1 BOOT</span> USB (i.e. no errors or
        malware infection):
            1. Remove the USB drive from the USB slot and immediately reinsert it.
            1. Wait 10 seconds for the operating system to recognize the USB.
            1. You may see the same error box pop up again. Select Ignore.
            1. The USB's device identifier may have changed. Find it again:
                ```
                $ diskutil list
                ```
            1.  
                ```
                $ cd $HOME/Downloads
                ```
            1.  
                ```
                $ sudo cmp -n `stat -f '%z' ubuntu-18.04.6-desktop-amd64.img.dmg` ubuntu-18.04.6-desktop-amd64.img.dmg USB-device-identifier-here
                ```
            1. Wait a few minutes for the verification process to complete.
            1. If all goes well, the command will output no data, returning to
            your usual terminal prompt.
            1. If there is a discrepancy, you’ll see a message like:
                ```
                ubuntu-18.04.6-desktop-amd64.img.dmg /dev/disk2
                differ: byte 1, line 1
                ```
                If you see a message like this, STOP -- this may be a security
                risk. Restart this section from the beginning. If the
                issue persists, try using a different USB drive or a different
                Setup Computer.

    1. **Ubuntu Desktop**
        1. If this is your first time using Ubuntu, note:
            1. You can copy-paste text in most applications (e.g. Firefox) by
            pressing **Ctrl-C** or **Ctrl-V**.
            1. You can copy-paste text in a *terminal window* by pressing
            **Ctrl-Shift-C** or **Ctrl-Shift-V**.
        1. Put Ubuntu on the <span class="setupboot">SETUP 1 BOOT</span> USB:
            1. Open the Ubuntu search console by clicking the purple
            circle/swirl icon in the upper-left corner of the screen.
            1. Type "startup disk creator" in the text box that appears
            1. Click on the "Startup Disk Creator" icon that appears.
            1. The "Source disc image" panel should show the.iso file you
            downloaded. If it does not, click the "Other" button and find it
            in the folder you downloaded it to.
            1. In the "Disk to use" panel, you should see two lines. They may
            vary from system to system, but each line will have a device
            identifier in it, highlighted in the example below.
                <pre>
                Generic Flash Disk (/dev/sda)
                Kanguru Flash Trust (<span class="primary">/dev/sdb</span>)</pre>
            1. Select the line containing <span class="setupboot">SETUP 1 BOOT</span> USB and make note of the
            disk identifier (e.g. /dev/sdb).
            1. Click "Make Startup Disk" and then click "Yes".
            1. Wait a few minutes for the copying process to complete.

        1. Verify the integrity of the <span class="setupboot">SETUP 1 BOOT</span> USB (i.e. no errors or malware infection):
            1. On your desktop, right-click the corresponding USB drive icon in
            your dock and select Eject from the pop-up menu.
            1. Remove the USB drive from the USB slot and immediately re-insert it.
            
                Technical details: In order to avoid detection, it's conceivable that malware
            might wait until a USB drive is in the process of being ejected (and all
            integrity checks presumably completed) before infecting the USB. Ejecting and
            re-inserting the USB before integrity checking is a simple workaround to
            defend against this.
            1. Wait 10 seconds for the operating system to recognize the USB.
            1. Navigate to the Downloads directory: 
                ```
                $ cd $HOME/Downloads
                ```
            1. Verify the integrity of the USB:
                <pre>
                $ sudo cmp -n `stat -c '%s' ubuntu-18.04.6-desk
                top-amd64.iso` ubuntu-18.04.6-desktop-amd64.iso <span class="primary">USB-dev
                ice-identifier-here</span></pre>
            1. If prompted for a password, enter the computer's root password.
            1. Wait a few minutes for the verification process to complete.
            1. If all goes well, the command will output no data, returning to
            your usual terminal prompt.
            1. If there is an issue, you'll see a message like:
                ```
                ubuntu-18.04.6-desktop-amd64.iso /dev/sda differ:
                byte 1, line 1
                ```
                If you see a message like this, STOP -- this may be a security
                risk. Restart this section from the beginning. If the issue
                persists, try using a different USB drive or a different Setup
                Computer.{% endif %}
    1. **Ubuntu Terminal**
        1. Put Ubuntu on the <span class="setupboot">SETUP 1 BOOT</span> USB:
            1. Insert your USB stick and type the following df command to see if it is mounted automatically on Ubuntu desktop:
                ```
                $ df
                ```
                See below sample output:
                ```
                Filesystem  1K-blocks  Used Available Use% Mounted on
                udev      16432268      0  16432268   0% /dev
                tmpfs     3288884   26244   3262640   1% /run
                tmpfs     3288880      24   3288856   1% /run/user/119
                tmpfs     3288880      72   3288808   1% /run/user/1000
                /dev/sda1 1467360 1467360   0         100% /media/vivek/data
                ```
            1. Unmount the USB drive.
                
                In the case of the above sample output, you need to unmount `sda1`:
                ```
                $ sudo umount /dev/sda1
                ```

            1. Type the following dd command to create a bootable USB image from the .iso file, replacing `/dev/sda` with the equivalent device identifier on your system. **Make sure to use the correct
            device identifier; <span style="color: red;">using the wrong one could overwrite your hard
            drive!</span>**
                ```
                $ sudo dd if=ubuntu-18.04.6-desktop-amd64.iso of=/dev/sda bs=1M
                ```
        1. Verify the integrity of the <span class="setupboot">SETUP 1 BOOT</span> USB (i.e. no errors or malware infection):
            1. On your desktop, right-click the corresponding USB drive icon in
            your dock and select Eject from the pop-up menu.
            1. Remove the USB drive from the USB slot and immediately re-insert it.

                Technical details: In order to avoid detection, it's conceivable that malware
            might wait until a USB drive is in the process of being ejected (and all
            integrity checks presumably completed) before infecting the USB. Ejecting and
            re-inserting the USB before integrity checking is a simple workaround to
            defend against this.
            1. Wait 10 seconds for the operating system to recognize the USB.
            1. Navigate to the Downloads directory:
                ```
                $ cd $HOME/Downloads
                ```
            1. Verify the integrity of the USB:
                <pre>
                $ sudo cmp -n `stat -c '%s' ubuntu-18.04.6-desk
                top-amd64.iso` ubuntu-18.04.6-desktop-amd64.iso <span class="primary">USB-dev
                ice-identifier-here</span></pre>
            1. If prompted for a password, enter the computer's root password.
            1. Wait a few minutes for the verification process to complete.
            1. If all goes well, the command will output no data, returning to
            your usual terminal prompt.
            1. If there is an issue, you'll see a message like:
                ```
                ubuntu-18.04.6-desktop-amd64.iso /dev/sda differ:
                byte 1, line 1
                ```
                If you see a message like this, STOP -- this may be a security
                risk. Restart this section from the beginning. If the issue
                persists, try using a different USB drive or a different Setup
                Computer.

1. Create the <span class="qboot">Q1 BOOT</span> USB:
    1. Boot the SETUP 1 computer from the <span class="setupboot">SETUP 1 BOOT</span> USB:
        1. Reboot the computer.
        1. Press your laptop's key sequence to bring up the boot device
        selection menu. (Some PCs may offer a boot device selection menu;
        see below.)
            1. **PC**: Varies by manufacturer, but is often **F12** or **Del**. The
            timing may vary as well; try pressing it when the boot logo appears.
                1. On the recommended Dell laptop, press F12. You should see a
                horizontal blue bar appear underneath the Dell logo.
                1. The recommended Acer laptop does not have a boot menu. See
                below for instructions.
{% if site.platform != "linuxOnly" %}
            1. **Mac**: When you hear the startup chime, **press and hold
            Option (⌥)**.
{% endif %}

        1. Select the proper device to boot from:
            1. **PC**: Varies by manufacturer; option will often say "USB"
            and/or "UEFI".
                1. On the recommended Dell laptop, select "USB1" under "UEFI
                OPTIONS".
                1. The recommended Acer laptop does not have a boot menu. See below
                for instructions.
{% if site.platform != "linuxOnly" %}
            1. **Mac**: Click the "EFI Boot" option and then click the up
            arrow underneath it.
                You do not need to select a network at this time. If more than
                one identical "EFI boot" option is shown, you may need to guess
                and reboot if you pick the wrong one.
{% endif %}
        1. Some laptops don't have a boot device selection menu, and you need to go into the BIOS configuration and change the boot order so that the USB drive is first. On the recommended Acer laptop:
             1. Press F2 while booting to enter BIOS configuration.
             1. Navigate to the Boot menu.
             1. Select USB HDD, and press F6 until it is at the top of the list.
             1. Press F10 to save and automatically reboot from the USB.
        2. If the computer boots into its regular OS rather than presenting you
        with a boot device or BIOS configuration screen, you probably pressed
        the wrong button, or waited too long.
            1. Hold down your laptop's power button for 10 seconds. (The
              screen may turn black sooner than that; keep holding it down.)
            2. Turn the laptop back on and try again. Spam the appropriate
            button(s) repeatedly as it boots.
            1. If the computer boots *immediately* to where it left off, you
            probably didn't hold down the power button long enough.
        1. You'll see a menu that says "GNU GRUB" at the top of the screen.
        Select the option "Try Ubuntu without installing" and press Enter.
        1. The computer should boot into the USB's Ubuntu desktop.

    1. Enable WiFi connectivity.
        1. Click the cone-shaped WiFi icon near the right side of the menu bar.
        2. If the dropdown says "No network devices available" at the top, you need to enable your networking drivers:
            1. Click on "System Settings". It's the gear-and-wrench icon along
            the left side of the screen.
            1. A System Settings window will appear. Click the "Software &
            Updates" icon.
            1. A Software & Updates window will appear. Click the "Additional
            Drivers" tab.
            1. In the Additional Drivers tab, you'll see a section for a
            Wireless Network Adapter. In that section, "Do not use the device"
            will be selected. Select any other option besides "Do not use the
            device."
            1. Click "Apply Changes".
            2. Click the cone-shaped WiFi icon near the right side of the menu
            bar again. There should be a list of WiFi networks this time.
        3. Select your WiFi network from the list and enter the password.
    2. Repeat steps 1-6 using the SETUP 1 computer to create the <span class="qboot">Q1 BOOT</span> USB
    rather than the <span class="setupboot">SETUP 1 BOOT</span> USB.
        1. **The instruction to plug a Quarantined Boot USB into your Setup
        computer should raise a red flag for you, because <span style="color: red;">you should never
        plug a quarantined USB into anything other than the quarantined
        computer it is designated for!</span>**

           This setup process is the ONE exception.
        1. Because you have booted the SETUP 1 computer off the <span class="setupboot">SETUP 1 BOOT</span>
        USB, you will follow the instructions for Ubuntu, even if your computer
        normally runs Windows or macOS.
        1. Immediately after you are finished executing steps 1-6 with the <span class="qboot">Q1 BOOT</span> USB, remove the <span class="qboot">Q1 BOOT</span> USB from the SETUP 1 computer:
            1. On your desktop, right-click the corresponding USB drive icon
            in your dock and select Eject from the pop-up menu.
            1. Remove the USB drive from the USB slot.
        2. **The <span class="qboot">Q1 BOOT</span> USB is now eternally quarantined. It should never again
        be plugged into anything besides the Q1 computer.**
1. Create the <span class="setupboot">SETUP 2 BOOT</span> USB and <span class="qboot">Q2 BOOT</span> USB
    1. Repeat steps 1-7 using the SETUP 2 computer, <span class="setupboot">SETUP 2 BOOT</span> USB, and <span class="qboot">Q2 BOOT</span> USB.
