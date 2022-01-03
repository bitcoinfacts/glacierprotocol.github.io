#!/bin/bash
# Run this script from the GlacierProtocol directory
set -e
rm Glacier.pdf
echo "Deleted old PDF"
read -p "Press any key to resume ..."
cp ../glacierprotocol.github.io/assets/glacier.pdf Glacier.pdf
echo "Copied new PDF"
read -p "Press any key to resume ..."
PDF_SHA=$(sha256sum Glacier.pdf | awk '{print $1}')
echo "New SHA for Glacier.pdf: $PDF_SHA"
read -p "Press any key to resume ..."
sed -i "s/.*Glacier.*/$PDF_SHA *Glacier.pdf/" SHA256SUMS
echo "Replaced Glacier.pdf sha256sum with new one IN SHA256SUMS file."
cat SHA256SUMS
read -p "Press any key to resume ..."
gpg --output SHA256SUMS.sig --detach-sig SHA256SUMS
echo "Generated detached signature SHA256SUMS.sig"
read -p "Press any key to resume ..."
sha256sum -c SHA256SUMS 2>&1
echo "SHA256SUMS verified"
read -p "Press any key to resume ..."
gpg --verify SHA256SUMS.sig SHA256SUMS
echo "Signature verified"
read -p "Press any key to resume ..."
git add -A
git status
echo "Ran 'git add'"
read -p "Press any key to resume ..."


