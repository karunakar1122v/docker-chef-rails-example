VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3001, host: 3001
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'development.json').read)

  config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
     chef.roles_path = "roles"
     chef.data_bags_path = "data_bags"
     chef.provisioning_path = "/tmp/vagrant-chef"

     chef.run_list = VAGRANT_JSON.delete('run_list')
     chef.json = VAGRANT_JSON
  end
end
