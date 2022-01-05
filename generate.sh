#!/bin/bash
# TODO: simplify these steps
# This script automates the steps of generating and signing a new version of the Glacier.pdf or Glacier-linux-only.pdf
# 1. First, run these commands:
#   make stop-site
#   make
#   rm ./assets/glacier.pdf
#   make pdf
# 2. In _config.yml, set "platform" to: "linuxOnly" and save
# 3. Run this script from the GlacierProtocol directory:
# root@Ubuntu:~/GlacierProtocol# ../glacierprotocol.github.io/generate.sh Glacier-linux-only.pdf
# 4. In _config.yml, set "platform" to: "all" and save
# 5. Run: root@Ubuntu:~/GlacierProtocol# ../glacierprotocol.github.io/generate.sh Glacier.pdf
# 6. git commit -m "you message"
# 7. git push bitcoinfacts master
# 8. git tag ...
# 9. Create a release in GitHub
set -e
rm $1
echo "Deleted old PDF: $1"
read -p "Press any key to resume ..."
cp ../glacierprotocol.github.io/assets/glacier.pdf $1
echo "Copied new PDF: $1"
read -p "Press any key to resume ..."
PDF_SHA=$(sha256sum $1 | awk '{print $1}')
echo "New SHA for $1: $PDF_SHA"
read -p "Press any key to resume ..."
echo "Current SHA256SUMS:"
cat SHA256SUMS
read -p "Press any key to resume ..."
sed -i "s/.*$1*/$PDF_SHA *$1/" SHA256SUMS
echo "Replaced $1 sha256sum with new one in SHA256SUMS file."
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


