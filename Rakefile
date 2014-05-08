SSH = 'ssh -i /home/jpratt/.vagrant.d/insecure_private_key -p 2222 -o StrictHostKeyChecking=no'
REPO = 'https://github.com/blunxy/mypuppet.git'

desc "Bootstrap Puppet on ENV['CLIENT'] with hostname ENV['HOSTNAME']"
task :bootstrap do
  client = ENV['CLIENT']
  hostname = ENV['HOSTNAME'] || client
  lame = "sudo hostname #{hostname}"
  lamer = "sudo su - c 'echo #{hostname} >/etc/hostname' && \"
  commands = <<BOOTSTRAP
sudo hostname #{hostname} && \
sudo su - c 'echo #{hostname} >/etc/hostname' && \
wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb && \
sudo dpkg -i puppetlabs-release-precise.deb && \
sudo apt-get update && sudo apt-get -y install puppet && \
sudo git clone #{REPO} /etc/puppet
BOOTSTRAP
  sh "#{SSH} #{client} '#{lame}' '#{lamer}'"
end

desc "Run Puppet on ENV['CLIENT']"
task :apply do
  client = ENV['CLIENT']
  sh "git push"
  sh "#{SSH} #{client} pull-updates"
end
