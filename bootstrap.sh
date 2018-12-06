#######Download and update the versions #######
sudo apt-get update -y
sudo apt install default-jdk -y


#######Install latest version of Jenkins #######
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y

#######install Chef server#######
wget -nv  https://packages.chef.io/files/stable/chef-server/12.17.33/ubuntu/16.04/chef-server-core_12.17.33-1_amd64.deb
dpkg -i /downloads/chef-server-core_12.17.33-1_amd64.deb
chef-server-ctl reconfigure
chef-server-ctl user-create chefadmin Chef Admin admin@4thcoffee.com insecurepassword --filename /drop/chefadmin.pem
chef-server-ctl org-create 4thcoffee "Fourth Coffee, Inc." --association_user chefadmin --filename 4thcoffee-validator.pem
sudo chmod u+x /tmp/install-chef-server.sh
sudo /tmp/install-chef-server.sh


#######Installation of Docker##########
curl https://download.docker.com/linux/ubuntu/gpg
sudo apt-get update -y
sudo apt-get install docker-ce -y
