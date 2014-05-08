REPO = 'https://github.com/blunxy/puppety.git'
client = ENV['client'] || "localhost"
hostname = ENV['hostname'] || "app"
fqd = ENV['fqd'] || "#{hostname}.local"
port = ENV['port'] || 2222
user = ENV['user'] || "vagrant"
private_key = ENV['key'] || "/home/jpratt/.vagrant.d/insecure_private_key"
command = "ssh -i #{private_key} -p #{port} -o StrictHostKeyChecking=no -l #{user} #{client}"


desc "Set hostname on ENV['CLIENT'] to ENV['HOSTNAME']"
task :set_host  do
    rename_hostname = "sudo sed -i \"s/precise64/#{hostname}/\" /etc/hostname"
    rename_hosts = "sudo sed -i \"s/precise64/#{fqd} #{hostname}/\" /etc/hosts"
    restart_hostname = "sudo service hostname restart"

    sh "#{command} '#{rename_hostname}'"
    sh "#{command} '#{rename_hosts}'"
    sh "#{command} '#{restart_hostname}'"
end

desc "Install Puppet"
task :install_puppet do
    sh "#{command} 'wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb'"
    sh "#{command} 'sudo dpkg -i puppetlabs-release-precise.deb'"
    sh "#{command} 'sudo apt-get update && sudo apt-get -y install puppet'"
end

task :install_puppet => :set_host