# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "bento/oraclelinux-9"
$rhel = <<EOF
route add default gw 10.24.0.1
eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`
EOF

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true

  config.vm.define :puppet do |puppet|
    puppet.vm.network "public_network"
    puppet.vm.provision "shell", run: "always", inline: $rhel
    puppet.vm.hostname = "puppet.preda.ca"  
    puppet.vm.synced_folder ".", "/puppet_course"
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
 end

  config.vm.define :web do |web|
    web.vm.network "public_network"
    web.vm.provision "shell", run: "always", inline: $rhel
    web.vm.hostname = "web.preda.ca"
    web.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :db do |db|
    db.vm.network "public_network"
    db.vm.provision "shell", run: "always", inline: $rhel
    db.vm.network "forwarded_port", guest: 8081, host: 8081
    db.vm.hostname = "db.preda.ca"
    db.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.network "public_network"
    zbs.vm.provision "shell", run: "always", inline: $rhel
    zbs.vm.hostname = "monitor.preda.ca"
    zbs.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zdb do |zdb|
    zdb.vm.network "public_network" 
    zdb.vm.provision "shell", run: "always", inline: $rhel
    zdb.vm.hostname = "zdb.preda.ca"
    zdb.vm.synced_folder ".", "/puppet_course"
  end
end
