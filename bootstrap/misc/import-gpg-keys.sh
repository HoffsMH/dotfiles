#! /bin/bash

curl https://mhkr.io/key.pub | gpg --import

# trust my key ultimately
fpr=$(curl mhkr.io/key.pub | gpg --with-fingerprint --with-colons | grep fpr | cut -d ':' -f 10)
echo  "$fpr:6:" | gpg --homedir "$HOME/.gnupg" --import-ownertrust


gpg-connect-agent "scd serialno" "learn --force" /bye

gpg-connect-agent updatestartuptty /bye
gpg-connect-agent reloadagent /bye

gpg-connect-agent updatestartuptty /bye
gpg-connect-agent reloadagent /bye

