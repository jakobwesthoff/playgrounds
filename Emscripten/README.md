# Emscripten Playground

This is a Playground conntaining a fully bootstrapped [Emscripten](https://github.com/kripken/emscripten) environment. Building the Emscripten SDK can be quite painful. This Vagrant/Ansible playgrounds fully automates every part of it.

## Details

The VM is based on Ubuntu 14.04 including the following services and packages
installed:

- Git
- CMake
- Ubuntu's build-essentials (gcc & Co.)
- curl & wget
- [nvm](https://github.com/creationix/nvm)
- [Nodejs](http://nodejs.org/)
    - 0.10.x
- Oracle Java 7
- Emscripten (including a fastcomp compatible LLVM/Clang)

The installed nodejs is managed using **nvm**.

The IP address of the VM is `10.152.149.103`.

After the VM is booted you may connect to it by executing `vagrant ssh`.

The directory `Shared` is shared between the host system and the VM. Inside the
VM it is accessible as `/home/vagrant/Shared`. It can be used to easily transport
source code between VM and host system.

The Emscripten compiler is added to the `PATH`. It is installed to
`/home/vagrant/Emscripten/SDK`. All dependencies, like llvm-clang are stored at
`/home/vagrant/Emscripten/Library`.

**WARNING**: The bootstrapping of Emscripten does involve the compilation of
a full LLVM Clang environment from source. Therefore the initial *build* process of the
VM can take quite some time (About 1h on my Macbook Pro Retina). Of course this
process is only necessary while initially building the VM, not while using it
later on.
