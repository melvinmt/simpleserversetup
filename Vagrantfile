# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # precise32/64 are two of the most common vagrant boxes ever
    # If you want something more current, try:
    # http://brightbox.com/vagrant/images/
    # https://cloud-images.ubuntu.com/vagrant/trusty/current/

    config.berkshelf.enabled = true

    # New hotness (Lua package names, PHP 5.5, nginx 1.4, more chocolate-chip cookies and milk)
    config.vm.box = "trusty64"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

    # The hostname the machine should have. If not given, Vagrant won't manage the hostname.
    # config.vm.hostname "vagrant-trusty64"
    
    # If you want to set the VM's private address
    # https://docs.vagrantup.com/v2/networking/private_network.html
    # config.vm.network "private_network", :type => "dhcp"
    config.vm.network "private_network", :ip => "192.168.50.50"

    # http, mysql, pgsql, mongo, redis, and rtmp port forwarding
    # (first 2 digits of port x2 = localhost port number)
    config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 3333, auto_correct: true
    #config.vm.network :forwarded_port, guest: 5432, host: 5454, auto_correct: true
    #config.vm.network :forwarded_port, guest: 27017, host: 2727, auto_correct: true
    #config.vm.network :forwarded_port, guest: 6379, host: 6363, auto_correct: true
    #config.vm.network :forwarded_port, guest: 1935, host: 1935, auto_correct: true

    # share this current folder with the virtual box
    config.vm.synced_folder "../", "/home/vagrant"

    # Also sync the www directory
    # config.vm.synced_folder "www", "/var/www/", :nfs => true

    # If true, then any SSH connections made will enable agent forwarding.
    config.ssh.forward_agent = true

    # Give this machine some power (default is 1 core and <500MB RAM)
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    ####################################
    # Provisioning using shell scripting
    ####################################

    # update before we start
    # config.vm.provision :shell, :inline => "sudo apt-get update --fix-missing"

    # copy the custom hosts file to the vm
    # config.vm.provision :shell, :inline => "cp /my_hosts /etc/hosts"

    # path to the shell script to install everything (or run once you `vagrant ssh` into the box)
    # config.vm.provision :shell, :path => "simpleserversetup sample-server"
    # 
    config.vm.provision :chef_solo do |chef|
        chef.roles_path = "roles"
        chef.add_role("simpleserver")
    end
end
