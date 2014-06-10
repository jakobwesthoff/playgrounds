# Nodejs Playground

This is a simple Playground conntaining different [nodejs](http://nodejs.org/) versions. It's main purpose is the usage for demonstrations and trainings, where I need clean installations. The VM built by this playgrounds allows me to ensure the demos are always working, without being dependant on my systems node installation.

## Details

The VM is based on Ubuntu 14.04 including the following services and packages
installed:

- Git
- Ubuntu's build-essentials (gcc & Co.)
- curl & wget
- [nvm](https://github.com/creationix/nvm)
- [Nodejs](http://nodejs.org/)
    - 0.8.x
    - 0.10.x
    - 0.11.x

After the environment is set up the following nodejs packages are installed
globally for node versions 0.10.x and 0.11.x via [npm](http://npmjs.org):

- [Grunt](http://gruntjs.com/)
- [Gulp](http://gulpjs.com)
- [Bower](http://bower.io)
- [Uglify-JS](https://github.com/mishoo/UglifyJS)
- [CoffeeScript](https://github.com/michaelficarra/CoffeeScriptRedux)
- [LiveScript](http://livescript.net/)
- [Traceur](https://github.com/google/traceur-compiler)

In addition to the globally installed packages the most recent version of my [JavaScript Browser Seed Project](https://github.com/jakobwesthoff/seed-js-browser) will be installed and setup under `/home/vagrant/Playground`.

All node versions are managed using **nvm**.

The IP address of the VM is `33.33.22.102`.

After the VM is booted you may connect to it by executing `vagrant ssh`.

The directory `Shared` is shared between the host system and the VM. Inside the
VM it is accessible as `/home/vagrant/Shared`. It can be used to easily transport
source code between VM and host system.
