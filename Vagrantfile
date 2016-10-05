# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder '.', '/vagrant', :disabled => true
  config.ssh.forward_agent = true
  config.vm.provision :shell, privileged: false, :inline => %[
    echo "Setup language"
    export DEBIAN_FRONTEND=noninteractive
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    sudo locale-gen en_US en_US.UTF-8
    sudo dpkg-reconfigure locales

    sudo apt-get -qq update -y > /dev/null
    echo "Installing from apt-get"
    sudo apt-get -qq install curl zsh git-all build-essential \
                         libssl-dev tmux postgresql postgresql-contrib -y &> /dev/null

    echo "Installing Postgresql"
    sudo -u postgres createuser --superuser $USER
    sudo -u postgres createdb $USER

    echo "Installing oh-my-zsh"
    git clone -q git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    sudo chsh -s /bin/zsh vagrant

    echo "Installing heroku toolbelt"
    cd ~/
    wget -qO install-heroku.sh https://toolbelt.heroku.com/install-ubuntu.sh &> /dev/null
    sh install-heroku.sh &> /dev/null

    echo "Installing nvm"
    export NVM_DIR="$HOME/.nvm" && (
      rm -rf "$NVM_DIR"
      git clone -q https://github.com/creationix/nvm.git "$NVM_DIR"
      cd "$NVM_DIR"
      git checkout -q `git describe --abbrev=0 --tags --match "v[0-9]*" origin` > /dev/null
    ) && . "$NVM_DIR/nvm.sh"

    echo "Installing ruby-install"
    cd ~/
    wget -qO ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
    tar -xzvf ruby-install-0.6.0.tar.gz > /dev/null
    cd ruby-install-0.6.0/
    sudo make install > /dev/null

    echo "Installing chruby"
    cd ~/
    wget -qO chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz > /dev/null
    tar -xzvf chruby-0.3.9.tar.gz > /dev/null
    cd chruby-0.3.9/
    sudo make install > /dev/null

    echo "Installing dotfiles"
    git clone -q https://github.com/flemse/dotfiles.git ~/.dotfiles > /dev/null
    cd ~/.dotfiles
    ./symlinks.sh

    #-------------------Done installing stuff-------------------

    echo "Setup vim"
    vim +BundleInstall +qall! &> /dev/null
  ]

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
