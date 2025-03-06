# Automate a Puppet dev/test environment with Vagrant and Bolt
Create a local dev env by installing VMware Workstation Pro (free for personal use), git, and VSCode, and Vagrant
1. Install Vagrant VMware Utility 
  - https://developer.hashicorp.com/vagrant/docs/providers/vmware/vagrant-vmware-utility
2. Install vagrant manually.
3. Install vagrant plugins: 
  - vagrant plugin install vagrant-hostmanager
  - vagrant plugin install vagrant-VMware-desktop
### If Vagrant is installed before VMware or any provider, it will not
### recognize the VMware provider [^1]
[^1]: The common error is: "No usable default provider could be found for your system."
Configure the following ENV var in the user scope: VAGRANT_DEFAULT_PROVIDER vmware_desktop