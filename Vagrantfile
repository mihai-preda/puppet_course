# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "bento/oraclelinux-9"
$rhel = <<EOF
route add default gw 10.24.0.1
EOF

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  # NOT NEEDED FOR PUBLIC NET
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_guest = true
  
  config.vm.define :puppet do |puppet|
    puppet.vm.hostname = "puppet.preda.ca"
    puppet.vm.network :public_network, ip: "10.24.0.10", hostname: true
    puppet.vm.provision "shell", run: "always", inline: $rhel
    puppet.vm.synced_folder ".", "/puppet_course"
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
 end

  config.vm.define :web do |web|
    web.vm.hostname = "web.preda.ca"
    web.vm.network :public_network, ip: "10.24.0.11", hostname: true
    web.vm.provision "shell", run: "always", inline: $rhel
    web.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :db do |db|
    db.vm.hostname = "db.preda.ca"
    db.vm.network :public_network, ip: "10.24.0.12", hostname: true
    db.vm.provision "shell", run: "always", inline: $rhel
    db.vm.synced_folder ".", "/puppet_course"
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.hostname = "monitor.preda.ca" 
    zbs.vm.network :public_network, ip: "10.24.0.13", hostname: true
    zbs.vm.provision "shell", run: "always", inline: $rhel
    zbs.vm.synced_folder ".", "/puppet_course"
  end

  # #  config.vm.define :wss22 do |wss22|
  #    wss22.vm.network :public_network, :ip => '172.16.10.15'
  #    wss22.vm.hostname = "wss22.preda.ca"
  #    wss22.vm.synced_folder ".", "/puppet_course"
  #    wss22.vm.provider :vmware_desktop do |vb|
  #     #vb.gui = true
  #  end
  # end
end
