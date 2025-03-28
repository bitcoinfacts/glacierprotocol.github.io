---
title: Transaction Execution and Verification
---

On any Internet-connected computer:

1. Access the <span class="warning">raw signed transaction</span> you sent
yourself from your smartphone previously.
1. Verify the transaction data.
    1. Go to <https://coinb.in/#verify>.
    1. Copy-paste the <span class="warning">raw signed transaction</span> into
    the webpage and click Submit.
    1. Under "Outputs":
        1. **<span style="color: red;">Verify the destination address is correct.</span>**
        1. Verify the amount going to the destination address is correct.
        1. If you did *not* withdraw all funds from these unspent transactions,
        you'll also see a second output which "sends" the remainder of the
        funds "back" to your
        <span class="warning">cold storage address</span>. This is necessary;
        it's how Bitcoin is designed to operate.
1. Execute the transaction.
    1. Go to <https://coinb.in/#broadcast> (or any comparable public service
    which can broadcast a <span class="warning">raw signed transaction</span>
    to the Bitcoin network).
    1. Copy-paste the <span class="warning">raw signed transaction</span> into the webpage and click Submit.
    1. You should see a green bar appear with a
    <span class="warning">transaction ID</span> in it. This is the
    <span class="warning">transaction ID</span> for your withdrawal; make a
    note of it.
1. Verify the withdrawal on the public blockchain:
    1. Go to [Blockstream](https://blockstream.info/) , paste
    the <span class="warning">destination address</span> into the search bar,
    and press Enter. You'll be taken to a page that says "Address" at
    the top, with the <span class="warning">destination address</span> listed underneath.
    1. Within a couple of seconds you should be able to refresh this page and see your
    unconfirmed transaction at the top of the transaction list.
    1. Periodically refresh the page until you see the funds reflected in "Confirmed Unspent".
    This may take anywhere from several minutes to many hours depending upon the fee rate you
    paid and how many other transactions are currently waiting to be confirmed on the network.
