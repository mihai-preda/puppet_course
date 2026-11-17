# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX = "almalinux/9"
# Host adapter the VMs bridge onto. VirtualBox needs the exact adapter name
# (list them with `VBoxManage list bridgedifs`); VMware ignores it.
BRIDGE = ENV.fetch("VAGRANT_BRIDGE", "Intel(R) Ethernet Controller I226-V")
# Bolt connects as vagrant over native ssh, so the vagrant user needs your
# public key. It is read from files/ssh_pubkey.pub (gitignored) or from the
# VAGRANT_SSH_PUBKEY environment variable, so it never lands in git.
PUBKEY_FILE = File.join(__dir__, "files", "ssh_pubkey.pub")
SSH_PUBKEY = ENV.fetch("VAGRANT_SSH_PUBKEY") {
  File.exist?(PUBKEY_FILE) ? File.read(PUBKEY_FILE).strip : ""
}

$sshkey = <<EOF
grep -qF '#{SSH_PUBKEY}' /home/vagrant/.ssh/authorized_keys || echo '#{SSH_PUBKEY}' >> /home/vagrant/.ssh/authorized_keys
EOF
$rhel = <<EOF
/usr/sbin/ip route add default via 10.21.2.254
/usr/bin/nmcli conn modify "System eth1" ipv4.dns  "10.21.2.254"
eval "$(route -n | awk '{ if ($8 == "eth0" && $2 != "0.0.0.0") print "route del default gw " $2; }')"
EOF

Vagrant.configure("2") do |config|
  config.vm.box = BOX
  config.vm.provision "shell", inline: $sshkey unless SSH_PUBKEY.empty?
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
  # NOT NEEDED FOR PUBLIC NET
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_guest = true

  config.vm.define :puppet do |puppet|
    puppet.vm.hostname = "puppet.preda.ca"
    puppet.vm.network :public_network, ip: "10.21.2.10", dev: 'eth0', bridge: BRIDGE
    puppet.vm.provision "shell", run: "always", inline: $rhel
    #puppet.vm.synced_folder ".", "/puppet_course" # Linux thinks this is an NFS mount and fails
    puppet.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
    puppet.vm.provider :virtualbox do |vb|
      vb.memory = 3072
    end
  end

  config.vm.define :web do |web|
    web.vm.hostname = "web.preda.ca"
    web.vm.network :public_network, ip: "10.21.2.11", dev: 'eth0', bridge: BRIDGE
    web.vm.provision "shell", run: "always", inline: $rhel
    #web.vm.synced_folder ".", "/puppet_course" # Linux thinks this is an NFS mount and fails
  end

  config.vm.define :db do |db|
    db.vm.hostname = "db.preda.ca"
    db.vm.network :public_network, ip: "10.21.2.12", dev: 'eth0', bridge: BRIDGE
    db.vm.provision "shell", run: "always", inline: $rhel
    #db.vm.synced_folder ".", "/puppet_course" # Linux this is an NFS mount and fails
    db.vm.provider :vmware_desktop do |vb|
      vb.memory = "3072"
    end
    db.vm.provider :virtualbox do |vb|
      vb.memory = 3072
    end
  end

  config.vm.define :zbs do |zbs|
    zbs.vm.hostname = "monit.preda.ca"
    zbs.vm.network :public_network, ip: "10.21.2.13", dev: 'eth0', bridge: BRIDGE
    zbs.vm.provision "shell", run: "always", inline: $rhel
    #zbs.vm.synced_folder ".", "/puppet_course" # Linux this is an NFS mount and fails
  end
end
