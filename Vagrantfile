# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "elastic/ubuntu-16.04-x86_64"
  config.vm.provider "libvirt"

  config.vm.define "db" do |db|
    db.vm.hostname = "db"
    db.vm.synced_folder ".", "/vagrant", disabled: true
    db.vm.provision "ansible" do |ansible|
      ansible.playbook = "packer/ansible/packer_db.yml"
    end
  end

  config.vm.define "app" do |app|
    app.vm.hostname = "app"
    app.vm.synced_folder ".", "/vagrant", disabled: true
    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "packer/ansible/packer_app.yml"
    end
  end

end
