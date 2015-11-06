# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

require 'yaml'

THE_PATH = __dir__ # absolute path to Ansible directory

couchdb_vars = YAML.load_file(File.join(THE_PATH, '_vars/couchdb.yml'))
nodejs_vars = YAML.load_file(File.join(THE_PATH, '_vars/nodejs.yml'))
common_vars = YAML.load_file(File.join(THE_PATH, '_vars/common.yml'))

def local_site_path(local_path)
  File.expand_path(local_path, THE_PATH)
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #CounchDB vm
  config.vm.define "couchdb" do |couchdb|
    couchdb.vm.hostname = "couchdb.local"
    couchdb.vm.network :private_network, ip: "10.152.149.104"

    #config.vm.box = "chef/ubuntu-14.04"
    couchdb.vm.box = couchdb_vars['box_name']

    couchdb.vm.provider :virtualbox do |vb|
        vb.name = "CouchDB Playground"

        # Properly configure the vm to use the available amount of cores
        vb.customize ["modifyvm", :id, "--cpus", `#{RbConfig::CONFIG['host_os'] =~ /darwin/ ? 'sysctl -n hw.ncpu' : 'nproc'}`.chomp]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]

        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    couchdb.vm.provision "ansible" do |ansible|
        ENV['ANSIBLE_CONFIG'] = "_vars/ansible.cfg"
        ansible.inventory_path = "CouchDB/Automation/Vagrant"
        ansible.limit = "all"
        ansible.playbook = "CouchDB/Automation/Provision.yml"
        ansible.verbose = false
    end
  end

  #Nodejs vm
  config.vm.define "nodejs" do |nodejs|
    nodejs.vm.hostname = "nodejs.local"
    nodejs.vm.network :private_network, ip: "10.152.149.102"

    #config.vm.box = "chef/ubuntu-14.04"
    nodejs.vm.box = nodejs_vars['box_name']

    nodejs.vm.provider :virtualbox do |vb|
        vb.name = "Nodejs Playground"

        # Properly configure the vm to use the available amount of cores
        vb.customize ["modifyvm", :id, "--cpus", `#{RbConfig::CONFIG['host_os'] =~ /darwin/ ? 'sysctl -n hw.ncpu' : 'nproc'}`.chomp]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]

        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    nodejs.vm.provision "ansible" do |ansible|
        ENV['ANSIBLE_CONFIG'] = "_vars/ansible.cfg"
        ansible.inventory_path = "Node.js/Automation/Vagrant"
        ansible.limit = "all"
        ansible.playbook = "Node.js/Automation/Provision.yml"
        ansible.verbose = false
    end

    nodejs.vm.synced_folder local_site_path(nodejs_vars['local_folder']), common_vars['www_root']
  end
end
