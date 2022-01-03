---
title: Prepare Non-Quarantined Hardware
---

1. Select two (2) computers which will be used as "Setup Computers" to set up USB
drives.

    1. Both Setup Computers must have Internet access.
    1. You should have administrator access to both Setup Computers.
    1. Importantly, at least one computer should be a computer that you *do not*
    own, or that doesn't spend much time on your home or office network.

        It's not technically ownership that's important. But computers you own are
        more likely to run the same software, have visited the same websites, or have
        been exposed to the same USB drives or networks -- and therefore to have the
        same malware.

1. Using sticky notes, label the two Setup Computers "SETUP 1" and "SETUP 2".
1. With a permanent marker, label two USB drives <span class="setupboot">SETUP 1 BOOT</span> and <span class="setupboot">SETUP 2 BOOT</span>.

    1. Remember that, per the equipment list, you should have 4 remaining USB
    drives -- two from one manufacturer, and two from a *different* manufacturer.
{% if site.platform != "linuxOnly" %}
1. Run a virus scan on the Setup Computers. If you don't have virus scanning
software installed, here are some options:

    * Windows: [Kaspersky](https://usa.kaspersky.com/) ($39.99/yr),
    [Avira](https://www.avira.com) (Free)
    * macOS: [BitDefender](https://www.bitdefender.com/) ($59.95/yr),
    [Sophos](https://home.sophos.com/) (Free)
    * Linux: Unnecessary

1. If the virus scan comes up with any viruses, take steps to remove them.
1. Once you have a clean virus scan, your Setup Computers are ready.
{% endif %}
