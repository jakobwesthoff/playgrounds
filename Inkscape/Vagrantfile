# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "inkscape.local"
  config.vm.network :private_network, ip: "10.152.149.105"

  config.vm.box = "chef/ubuntu-14.04"

  config.vm.provider :virtualbox do |vb|
      vb.name = "Inkscape Playground"

      # Properly configure the vm to use the available amount of cores
      vb.customize ["modifyvm", :id, "--cpus", `#{RbConfig::CONFIG['host_os'] =~ /darwin/ ? 'sysctl -n hw.ncpu' : 'nproc'}`.chomp]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]

      vb.customize ["modifyvm", :id, "--memory", 2048]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision "ansible" do |ansible|
      ENV['ANSIBLE_CONFIG'] = "./Automation/ansible.cfg"
      ansible.inventory_path = "Automation/Vagrant"
      ansible.limit = "all"
      ansible.playbook = "Automation/Provision.yml"
      ansible.verbose = false
  end

  # Make sure the VM allows X windows to be forwarded
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.synced_folder "./Shared", "/home/vagrant/Shared"
end
