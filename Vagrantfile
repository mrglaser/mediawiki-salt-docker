# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

Vagrant.configure(2) do |config|
    # Docker provider. Enable with `--provider=docker`
    config.vm.provider :docker do |d|
        d.image = "ubuntu:14.04"
    end

    config.vm.define "deploy" do |deploy|
        # deploy.vm.box = "ubuntu/trusty64"
        deploy.vm.host_name = "deploy"
        deploy.vm.network :private_network, ip: "10.10.10.2"
        deploy.vm.provision :salt do |salt|
            salt.minion_config = "salt/minion.conf"
            salt.install_master = false
            salt.run_highstate = true
       end
    end
end
