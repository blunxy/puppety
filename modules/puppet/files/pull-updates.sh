#!/bin/bash
eval `keychain --agents ssh --eval ~/.ssh/puppet-deploy`
git clone git@github.com:blunxy/mypuppet.git
sudo cp -r ~/mypuppet/* /etc/puppet/
cd /etc/puppet
rm ~/mypuppet -rf
/usr/local/bin/papply
