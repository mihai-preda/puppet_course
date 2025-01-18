# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "bento/oraclelinux-9"
$rhel = <<EOF
route add default gw 172.16.10.254
EOF

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  # NOT NEEDED FOR PUBLIC NET
  config.hostmanager.enabled = true
  config.hostmanager.manage_guest = true
  
  config.vm.define :puppet do |puppet|
    puppet.vm.network :private_network, :ip => '172.16.10.10' 
    puppet.vm.provision "shell", run: "always", inline: $rhel
    puppet.vm.hostname = "puppet.preda.ca"
    puppet.hostmanager.aliases = %w(puppet)
    puppet.vm.synced_folder ".", "/puppet_course"
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
 end

  config.vm.define :web do |web|
    web.vm.network :private_network, :ip => '172.16.10.11'
    web.vm.provision "shell", run: "always", inline: $rhel
    web.vm.hostname = "web.preda.ca"
    web.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :db do |db|
    db.vm.network :private_network, :ip => '172.16.10.12'
    db.vm.provision "shell", run: "always", inline: $rhel
    db.vm.hostname = "db.preda.ca"
    db.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.network :private_network, :ip => '172.16.10.13'
    zbs.vm.provision "shell", run: "always", inline: $rhel
    zbs.vm.hostname = "monitor.preda.ca"
    zbs.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zdb do |zdb|
    zdb.vm.network :private_network, :ip => '172.16.10.14'
    zdb.vm.provision "shell", run: "always", inline: $rhel
    zdb.vm.hostname = "zdb.preda.ca"
    zdb.vm.synced_folder ".", "/puppet_course"
  end
  # config.vm.define :tstnode do |tstnode|
  # end
end
