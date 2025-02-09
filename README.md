# Automate a Puppet dev/test environment with Vagrant and Bolt
Create a local dev env by installing WMware Workstation Pro (free for personal use), git, and VSCode, and Vagrant
1. Install Vagrant VMware Utility 
  - https://developer.hashicorp.com/vagrant/docs/providers/vmware/vagrant-vmware-utility
2. Install vagrant manually.
3. Install vagrant plugins: 
  - vagrant plugin install vagrant-hostmanager
  - vagrant plugin install vagrant-vmware-desktop
### If Vagrant is installed before vmware or any provider, it will not
### recognize the vmware provider [^1]
[^1]: The common errror is: "No usable default provider could be found for your system."
Configer the following ENV var in windows: VAGRANT_DEFAULT_PROVIDER vmware_desktop
manually in Windows env variabls for the user scope.
