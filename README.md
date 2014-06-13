# Playgrounds

A bunch of simple vagrant/ansible based playgrounds, with different environments and services installed.

Mostly those Vagrant based VMs are used by myself to test or demonstrate things regarding different technologies and/or daemons during conferences and trainings. Furthermore I am using them to play around with certain ideas and technologies, without affecting my base system.

I am publishing those VMs, as they might be able useful to other people as well. Pull requests with new Playgrounds, or additions and fixes of already existing ones are of course always welcome.


## Usage

In order to make use of any playground you need to have a recent version of [Vagrant](http://www.vagrantup.com/) as well as [Ansible](http://www.ansible.com/home) installed on your system. After having done so, just switch to any of the playground directories and execute the `vagrant up` command. The corresponding VM will automatically be build, provisioned and run. A `vagrant ssh` call allows you to *enter* the VM after it has been created.

Further information regarding each playground can be found in its corresponding README file.

### Useful Vagrant commands

The commands you will most like need during your work with *Vagrant* and any of the Playgrounds are the following:

- `vagrant up` - Boot up the corresponding Playground
- `vagrant halt` - Shutdown the Playgrounds VM
- `vagrant ssh` - Connect into the VM via ssh.
- `vagrant provision` - Rerun the provisioner (Ansible) in order to setup the environment (Especially useful if you changed some of the provisioning files and want to apply your changes without rebuilding the whole VM.)
- `vagrant destroy` - Destroy the created VM to free HDD space. (**Warning**: This will destroy all your customizations of course.)

**Tip:** All these commands need to be executed from within the Playgrounds directory, as Vagrant searches for the VM to manage under the current working directory. 

## Existing Playgrounds

The following list depicts a short summary of the available Playgrounds as well as there most important information. Detailed information about each of the Playgrounds can be found inside the README file placed inside their corresponding directory. More Playgrounds will be created and pushed over time.

- **CouchDB** - Recent Erlang Environment as well as CouchDB installation
	- IP: 10.152.149.104
	- CouchDB Port: 5984
	- No shared folders
- **Elasticsearch** - Recent Elasticsearch installation
	- IP: 10.152.149.101
	- Elasticsearch Port: 9200
	- No shared folders
- **Emscripten** - Recent Emscripten compile environment using the latest backend
 	- IP: 33.33.22.103
	- No running external services
	- Shared Folder: `Shared` -> `/home/vagrant/Shared`
- **Node.js** - Environment containing different Nodejs versions as well as several basic npm packages and my [JavaScript Browser Seed](https://github.com/jakobwesthoff/seed-js-browser) as a starting point.
	- IP: 33.33.22.102
	- No running external services
	- Shared Folder: `Shared` -> `/home/vagrant/Shared`


## Technology

The VMs are all managed using [Vagrant](http://www.vagrantup.com), a commandline based Toolchain to build, control and manage all different kinds of virtualization software. By default *Vagrant* uses [VirtualBox](https://www.virtualbox.org/) as a virtualization environment. Eventhough other Backends are supported nowadays, I only tested the Playgrounds with *VirtualBox*.

In order to provision the VMs (aka. install and configure the needed environment) I am using [Ansible](http://www.ansible.com) in favor of [Puppet](http://puppetlabs.com/). Eventhough I used *Puppet* for quite some time I currently prefer *Ansible* as it allows for a cleaner structure and syntax in my opinion.

The different Playgrounds and *Ansible Roles* can furthermore be a nice example, of how to structure and utilize *Ansible* to provision VMs or bare metal machines.

The different *Roles* (Ansible speak for a common group of tasks) are shared between all VM definitions and can be found at `Library/Ansible/Roles`.


## Further reading

A [blogpost](http://www.westhoffswelt.de/blog/2014/6/10/playgrounds-with-vagrant-and-ansible) regarding this repository, which contains some further information can be found in my [personal blog](http://www.westhoffswelt.de/blog/2014/6/10/playgrounds-with-vagrant-and-ansible)
