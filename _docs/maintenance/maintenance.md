---
title: Maintenance Protocol
---

The Maintenance Protocol is designed to minimize the risk of losing funds due to:

* **Loss of private keys**: Obviously if too many keys are compromised or lost
(due to theft, damage, or misplacement), your funds are lost. It's therefore
important to know ASAP if even a single key is lost, so you can generate a
replacement before more keys are lost.
* **New security threats**: Glacier may contain weaknesses which are currently
undiscovered -- perhaps related to attacks which are not part of the current
security landscape.
* [Bit rot](https://en.wikipedia.org/wiki/Software_rot):
The Withdrawal Protocol depends on the availability of certain software
(including not just the applications themselves, but also software libraries
those applications depend on), plus hardware and networks that are compatible
with that software. If your funds are in storage for a long time, the
withdrawal tools may become obsolete and no longer function.

We recommend the Maintenance Protocol be executed **six months** after the
initial deposit into cold storage, and **annually** thereafter.

1. Execute the Viewing Protocol to view the balance of the
<span class="warning">cold storage address</span> and ensure that it is as
expected.
1. Check for Glacier security upgrades:
    1. Access the latest full release of Glacier (*not* just the protocol
    document) at
    [https://github.com/bitcoinfacts/GlacierProtocol/releases/latest](https://github.com/bitcoinfacts/GlacierProtocol/releases/latest).
    1. Locate Release Notes for all versions since the last time
    you executed the Maintenance Protocol (or if it's the first time, since the
    Glacier version specified on your
    <span class="warning">Cold Storage Information Page</span>).
    1. See whether any of those releases recommend any security upgrades.
    1. Whether or not you decide to upgrade, review the errata for the version
    of Glacier you are using at
    [https://github.com/bitcoinfacts/GlacierProtocol/releases](https://github.com/bitcoinfacts/GlacierProtocol/releases).
1. Have each <span class="danger">Cold Storage Information Packet</span>
visually inspected (either by you, or the signatory that has it in custody):
    1. Verify the packet is in its expected location.
    1. Verify the packet's location is secured as expected (any locks in
    working order, etc.)
    1. Verify the packet is in good physical condition.
    1. Verify the tamper-resistant seals appear to be intact.
1. Execute the Withdrawal Protocol for a small test amount.
1. Create a reminder for yourself in one year to execute the Maintenance
Protocol again. (If you don't have a reminder system you trust, find one
on the web.)
