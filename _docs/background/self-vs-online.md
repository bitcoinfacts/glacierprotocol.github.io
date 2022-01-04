---
title: "Self-Managed Storage vs Online"
---

Let's start by assessing whether Glacier is right for you.

There is no such thing as perfect security. There are only degrees of security,
and those degrees come at a cost (in time, money, convenience, etc.) So the
first question is: How much security are you willing to invest in?
For most people, most of the time, the authors recommend storing Bitcoin using a
high-quality online storage service. The pros and cons of the various online
services are beyond the scope of this document, but most popular ones are fairly
secure and easy to use. Some popular options are
[Coinbase](https://www.coinbase.com/),
[Gemini](https://gemini.com/),
and [Kraken](https://www.kraken.com/).

However, all online storage services still come with some notable risks
which self-managed storage does not have:

1. **Identity spoofing**: Your account on the service could be hacked (including
through methods such as identity theft, where someone convinces the service they
are you).
1. **Network exposure**: Online services still need to transmit security-critical
information over the Internet, which creates an opportunity for that information
to be stolen. In contrast, self-managed storage can be done with no network
exposure.
1. **Under constant attack**: Online services can be hacked by attackers from
anywhere in the world. People know these services store lots of funds, which
makes them much larger targets. If there's a flaw in their security, it's more
likely to be found and exploited.
1. **Internal theft**: They have to protect against internal theft from a large
group of employees & contractors.
1. **Intentional seizure**: They have the ability (whether of their own volition,
or under pressure from governments) to seize your funds.
There is historical precedent for this, even if funds are not suspected of
criminal involvement. In 2010,
[Cyprus unilaterally seized many bank depositors' funds ](https://www.theguardian.com/world/2013/mar/25/cyprus-bailout-deal-eu-closes-bank)
to cope with an economic crisis. In 1933, the US abruptly
[demanded citizens surrender almost all gold they owned to the government](https://en.wikipedia.org/wiki/Executive_Order_6102).
Regardless of how one views the political desirability of these particular
decisions, there is precedent for governments taking such an action, and one
cannot necessarily predict the reasons they might do so in the future.
Furthermore,Bitcoin still operates in a political and legal grey zone, which
increases these political risks.

Some online wallet services have insurance to cover losses, although that
insurance doesn't protect against all of these scenarios, and often has limits
on the amount insured.

These risks are not theoretical. Many online services have lost customers' funds
(and not reimbursed them), including
[Mt. Gox](https://www.bloomberg.com/news/articles/2014-02-28/mt-gox-exchange-files-for-bankruptcy),
[Bitfinex](http://www.bbc.com/news/technology-37009319),
and many more.

Recently, some providers are rolling out services which are a hybrid
of an online service and self-managed storage. Examples include
[Coinbase's multisig vault](https://www.coinbase.com/vault)
and [Green Address](https://greenaddress.it/en/).
The design of these services
significantly reduces (though does not eliminate) the risks described above.

However, they also require some care and technical competence to securely
manage the electronic "keys" which provide access to funds.

Many people do use online or hybrid solutions to store sizeable amounts of
money. We recommend self-managed storage for large investments, but ultimately
it's a personal decision based on your risk tolerance and costs you're willing
to pay (in money and time) for security.

Glacier focuses exclusively on self-managed storage.

