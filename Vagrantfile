Vagrant.configure("2") do |config|
		config.vm.define "server" do |vm1|
			vm1.vm.box="ubuntu/trusty64"
			vm1.vm.network :private_network, ip: "10.0.1.15"
			vm1.vm.hostname="server"
			vm1.vm.network "forwarded_port", guest: 443, host: 8000
			vm1.vm.provision :shell, path: "bootstrap.sh"
		end
		config.vm.define "node" do |vm2|
			vm2.vm.box="ubuntu/trusty64"
			vm2.vm.network :private_network, ip: "10.0.1.16"
			vm2.vm.hostname="client"
			vm2.vm.network "forwarded_port", guest: 8080, host: 8080
		end
end
