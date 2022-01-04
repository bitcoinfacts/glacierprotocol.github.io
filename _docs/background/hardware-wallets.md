---
title: Glacier vs Hardware Wallets
---

Many people who choose
self-managed storage (as opposed to an online storage service) use "hardware
wallets" such as the
[Trezor](https://trezor.io/),
[Ledger](https://www.ledgerwallet.com/),
and [KeepKey](https://www.keepkey.com/)
to store their bitcoins. While these are great products that provide strong security,
Glacier is intended to offer an even higher level of protection than today's
hardware wallets can provide.

The primary security consideration is that
all hardware wallets today operate via a physical USB link to a regular
computer. While they employ extensive safeguards to prevent any sensitive
data (such as private keys) from being transmitted over this connection,
it's possible that an undiscovered vulnerability could be exploited by
malware to steal private keys from the device.

For details on this and other security considerations, see the
"No Hardware Wallets" section of the [design document](../../design-doc/overview).
As with online multisig
vaults, many people do use hardware wallets to store sizeable amounts of
money. We personally recommend Glacier for large investments, but ultimately
it's a personal decision based on your risk tolerance and costs you're
willing to pay (in money and time) for security.
