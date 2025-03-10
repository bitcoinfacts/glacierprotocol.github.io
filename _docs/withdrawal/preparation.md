---
title: Preparation
redirect_from: /docs/withdrawal/
---

The Withdrawal Protocol is used to transfer bitcoins out of high-security
cold storage.

Before beginning, consider whether you want to route your funds through one or
more intermediary non-cold-storage addresses for privacy purposes. (Review the
[Privacy Considerations](../../overview/overview/) subsection for details.) If you do, you may want to
withdraw the funds to an intermediary address *first* before sending them on to
their final destination.

In this first section, we'll gather physical hardcopies of all information
needed to do the withdrawal. This is done with the help of a regular networked
computer to find some of this information online and translate it into printed
QR codes.

On any Internet-connected computer:

1. If this is **not** your first time working with Glacier:
    1. Use a networked computer to access the latest full release of Glacier (
    not just the protocol document) at <https://github.com/bitcoinfacts/GlacierProtocol/releases/latest>.
    1. Check the Release Notes to see if there are any new versions of Glacier recommended.
    1. Whether or not you decide to upgrade, review the errata for the version
    of Glacier you are using at <https://github.com/bitcoinfacts/GlacierProtocol/releases>.
2. Open your electronic copy of the
<span class="warning">Cold Storage Information Page</span>
(see [Section II of the Deposit Protocol](../../deposit/transfer-to-paper/) for details).
1. Identify the blockchain transactions associated with the funds you'd like
to withdraw:
    1. If you have you have your own Bitcoin node, such as [Umbrel](https://getumbrel.com/):  
        1. SSH to it:
        ```
        $ ssh umbrel@umbrel.local
        ```

        1. Then run:  
            <pre>$ ~/umbrel/bin/bitcoin-cli scantxoutset start '["addr(<span class="warning">cold sto
        rage address</span>)"]'</pre>

        1. It will take 1-2 minutes to complete. It will list all unspent transactions for the given address.
    1. If you don't have your own Bitcoin node:
        1. Go to [Blockstream](https://blockstream.info/), paste your
        <span class="warning">cold storage address</span> into the search bar,
        and press Enter.
        1. You'll be taken to a page that says "Address" at the top, with
        your <span class="warning">cold storage address</span> listed underneath.
        1. Below that, the page will show a list of
        **<span class="warning">transaction IDs</span>**
        (on the left) and their corresponding **amounts** (on the right).
        Each <span class="warning">transaction ID</span> corresponds to a deposit
        you made, the remainder of a deposit you made after doing a partial
        withdrawal, or a deposit someone else made to your cold storage address.
        1. For each transaction, click on the "Details" button to determine whether
        the transaction has some unspent amount (the "Spending Tx" field will be shown as "Unspent").
    2. Identify a set of <span class="warning">transaction IDs</span> whose unspent amounts are **cumulatively**
    greater than or equal to the amount you would like to withdraw.
    If a transaction ID is listed more than once (i.e. the same transaction
    has more than one unspent output going to your cold storage address), you
    just need to include the transaction ID once. GlacierScript will include
    all UTXOs in every supplied transaction ID.
    1. Copy-paste these <span class="warning">transaction IDs</span> to a temporary scratchpad for
    reference. These will be referred to as **<span class="warning">unspent transaction IDs</span>**.
1. Get raw data for blockchain transactions:
    1. For each <span class="warning">unspent transaction ID</span> from your
    temporary scratchpad:
        1. If you have your own Bitcoin node, run:
            <pre>$ ~/umbrel/bin/bitcoin-cli getrawtransaction <span class="primary">transaction-id-here</span></pre>
        2. Otherwise, go to the following URL, substituting the unspent transaction ID in
        the specified place:
           [https://blockchain.info/rawtx/<span class="primary">transaction-id-here</span>?format=hex](https://blockchain.info/rawtx/transaction-id-here?format=hex)

           Example page contents:
           <pre><span class="warning">01000000016847105309a8604c7e4f5773d0a16c45248acce057dab62e
           db0fedc2810d49a4010000006b48304502210093e6b4154d42c1bba27c
           548a80488673967be32c8de2f11e01a1402a5500e13302203e20874e5d
           0af516c902d3b600ee94571a7ce68a14a384dc05d4346e1009fe000121
           039fd6f25c87f183260c1d4a3a3ae33a2c06414db4c40d0c2ab76a7192
           1fef0939ffffffff01e0930400000000001976a914e770a7c13f977478
           3e80607f40be4547780315b688ac00000000</span></pre>

   1. This entire page be referred to as a
   **<span class="warning">raw unspent transaction</span>**.
   1. Copy-paste the <span class="warning">raw unspent transaction</span>
   next to the unspent <span class="warning">transaction ID</span> in
   your temporary scratchpad.
2. Create QR codes:
    1. Find an online QR code generator, such as <http://goqr.me>.
    2. For each unspent <span class="warning">transaction ID</span> in your
    temporary scratchpad:
        1. Copy-paste the <span class="warning">raw unspent transaction</span>
        into the QR code generator.

            **NOTE:**  Some raw unspent transactions are too long to be converted
            into a single QR code -- or the QR code may be such high resolution
            that some QR code readers may struggle to read it.

            In these cases, you will need to split the data into multiple QR
            codes, and manually splice them back together on the quarantined
            computer after decoding each QR codes.

            **Make sure there is no extra
            whitespace (i.e. a space, or pressing "Enter") at the end of any
            copy-pastes! This can change the QR code.**

        1. Print out the resulting <span class="warning"> QR code</span>. (If
          printing from goqr.me, just print the first page.)
        2. Write "raw unspent transaction" somewhere on the printout.
    1. Repeat step (b) above for other needed information:
        1. <span class="warning">Cold storage address</span> (from the <span class="warning">Cold Storage Information Page</span>)
        2. Redemption script (from the <span class="warning">Cold Storage Information Page</span>)
        3. <span class="warning">Destination address</span> to which you will be withdrawing the funds:
            1. **Carefully** transcribe the destination address by hand on the printed page with its QR code. (This will facilitate verification in the quarantined environment.)
            2. Double-check that the transcribed address is correct.
            3. If you are sending funds directly to another party with whom you do *not* have high trust, be mindful of the risk of transaction malleability fraud.
3. Gather other information:
    1. Make sure you have the necessary number of <span class="danger">Cold Storage Information Packets</span> on hand (you'll need the private keys).
        1. For the recommended 2-of-n multisignature withdrawal policy,
        you'll need any 2
        <span class="danger">Cold Storage Information Packets</span>.
        1. If you are performing an initial test withdrawal, you'll need *all*
        <span class="danger">Cold Storage Information packets</span>.
    2. Get transaction fee market data:

        The operators of the Bitcoin network require a (very small) fee for
        processing transactions. There is not a fixed fee schedule; if the fee
        is too low, the withdrawal will never get processed, and if the fee is
        too high, you unnecessarily waste money. This data will be used to
        calculate a reasonable fee for expedient transaction processing.

        1. Note that different services return fee estimates in different units.
        We are interested in the rate of satoshis / byte (or vbyte) rather than
        satoshis / kilobyte (or kB) or BTC / kB.
        1 satoshi = 10^-8 BTC and a typical transaction is under 1000 bytes.
        As of late 2019, between 1 and 100 satoshis / byte is typical. **If the number is
        radically higher than 100 or less than 1, stop; something may be wrong.** Seek assistance.

        1. If you are running a Bitcoin Core full node, you can run:
        ```
        $ bitcoin-cli estimatesmartfee 6
        ```
        This returns a fee rate in BTC/kB; multiply the result by 100,000 to get satoshis / byte.

        1. Otherwise, use a service listed at <https://b10c.me/A-list-of-public-feerate-estimator-APIs/>

        2. Write the fee estimate corresponding to your desired confirmation time on a piece of paper
        labeled "Fee rate." Round up to the nearest whole number in units of satoshis / byte.
