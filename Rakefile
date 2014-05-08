
client = ENV['client'] || "localhost"
hostname = ENV['hostname'] || "app"
fqd = ENV['fqd'] || "#{hostname}.local"
port = ENV['port'] || 2222
user = ENV['user'] || "vagrant"
private_key = ENV['key'] || "/home/jpratt/.vagrant.d/insecure_private_key"

SSH = "ssh -i #{private_key} -p #{port} -o StrictHostKeyChecking=no -l #{user} #{client}"
REPO = 'https://github.com/blunxy/puppety.git'

task :default =>  :install_puppet

task :install_puppet => :set_host

desc "Set hostname on ENV['CLIENT'] to ENV['HOSTNAME']"
task :set_host  do
  rename_hostname = "sudo sed -i \"s/precise64/#{hostname}/\" /etc/hostname"
  ssh_command(rename_hostname)

  rename_hosts = "sudo sed -i \"s/precise64/#{fqd} #{hostname}/\" /etc/hosts"
  ssh_command(rename_hosts)

  restart_hostname_service = "sudo service hostname restart"
  ssh_command(restart_hostname_service)
end

desc "Install Puppet"
task :install_puppet do
    ssh_command "wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb"
    ssh_command "sudo dpkg -i puppetlabs-release-precise.deb"
    ssh_command "sudo apt-get update && sudo apt-get -y install puppet"
end

desc "Pull down Puppet structure from Github."
task :pull_puppet_structure do
  ssh_command "sudo apt-get -y install git"
  ssh_command "sudo rm -rf /etc/puppet"
  ssh_command "sudo git clone #{REPO} /etc/puppet"
end

desc "Run Puppet manifest."
task :run_puppet_manifest do
  ssh_command "sudo puppet apply /etc/puppet/manifests"
end


def ssh_command(cmd)
  sh "#{SSH} '#{cmd}'"
end
