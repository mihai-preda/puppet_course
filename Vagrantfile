# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "bento/oraclelinux-9"
$rhel = <<EOF
route add default gw 10.21.2.254
nmcli conn modify "System eth1" ipv4.dns  "10.21.2.254"
EOF

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  # NOT NEEDED FOR PUBLIC NET
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_guest = true
  
  config.vm.define :puppet do |puppet|
    puppet.vm.hostname = "puppet.preda.ca"
    puppet.vm.network :public_network, ip: "10.21.2.10"
    puppet.vm.provision "shell", run: "always", inline: $rhel
    puppet.vm.synced_folder ".", "/puppet_course"
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
 end

  config.vm.define :web do |web|
    web.vm.hostname = "web.preda.ca"
    web.vm.network :public_network, ip: "10.21.2.11"
    web.vm.provision "shell", run: "always", inline: $rhel
    web.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :db do |db|
    db.vm.hostname = "db.preda.ca"
    db.vm.network :public_network, ip: "10.21.2.12"
    db.vm.provision "shell", run: "always", inline: $rhel
    db.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.hostname = "monitor.preda.ca" 
    zbs.vm.network :public_network, ip: "10.21.2.13"
    zbs.vm.provision "shell", run: "always", inline: $rhel
    zbs.vm.synced_folder ".", "/puppet_course"
  end
end
