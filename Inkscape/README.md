# Inkscape Playground

This is a simple Playground conntaining a current [Inkscape](http://www.inkscape.org/) installation.

## Reasoning

The reason behind this playground, is the inability of Inkscape to properly and
fully run on an OS X platform. Even though it is possible to execute Inkscape
through [XQuartz](), there are still certain incompatibilities, that annoy the
hell out of me. Therefore I am using this VM to run Inkscape inside an Ubuntu
System, exporting its X-Window through a local ssh connection to the VM.

## Details

The VM is based on Ubuntu 14.04 including the following services and packages
installed:

- Xorg Display libraries
- XAuth (to allow X11 forwarding via SSH)
- Inkscape

The IP address of the VM is `10.152.149.105`.

After the VM has bootet you can easily start and export the Inkscape X Window
using the following script from within the playgrounds directory:

    ./runInkscape.sh

If this does not work for you, you may issue the following command manually to
establish the ssh connection and run inkscape:

    ssh -X $(vagrant ssh-config | awk '{print " -o "$1"="$2}') localhost -- '/usr/bin/inkscape' --with-gui

The directory `Shared` is shared between the host system and the VM. Inside the
VM it is accessible as `/home/vagrant/Shared`. It can be used to easily
transport your assets between VM and host system.
