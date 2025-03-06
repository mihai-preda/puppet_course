# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "bento/oraclelinux-9"
$rhel = <<EOF
eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`
EOF
# route add default gw 10.21.2.254
# nmcli conn modify "System eth1" ipv4.dns  "10.21.2.254"

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  # NOT NEEDED FOR PUBLIC NET
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_guest = true
  
  config.vm.define :puppet do |puppet|
    puppet.vm.hostname = "puppet.preda.ca"
    puppet.vm.network :public_network,
      use_dhcp_assigned_default_route: true
    puppet.vm.provision "shell", run: "always", inline: $rhel
    puppet.vm.synced_folder ".", "/puppet_course"
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
 end

  config.vm.define :web do |web|
    web.vm.hostname = "web.preda.ca"
    web.vm.network :public_network,
      use_dhcp_assigned_default_route: true
    web.vm.provision "shell", run: "always", inline: $rhel
    web.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :db do |db|
    db.vm.hostname = "db.preda.ca"
    db.vm.network :public_network,
      use_dhcp_assigned_default_route: true
    db.vm.provision "shell", run: "always", inline: $rhel
    db.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.hostname = "monitor.preda.ca" 
    zbs.vm.network :public_network,
      use_dhcp_assigned_default_route: true
    zbs.vm.provision "shell", run: "always", inline: $rhel
    zbs.vm.synced_folder ".", "/puppet_course"
  end
end
