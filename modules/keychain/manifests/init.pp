class keychain {
  package { "keychain": ensure => present }

  file { '/home/vagrant/.bash_profile':
    source => 'puppet:///modules/keychain/.bash_profile',
    owner   => 'vagrant',
    group  => 'vagrant',
  }

  file { '/home/vagrant/.ssh/config':
    source => 'puppet:///modules/keychain/config',
    owner   => 'vagrant',
    group  => 'vagrant',
  }

  file { '/home/vagrant/.ssh/puppet-deploy':
    source => 'puppet:///modules/keychain/puppet-deploy',
    owner   => 'vagrant',
    group  => 'vagrant',
  }

  file { '/home/vagrant/.ssh/puppet-deploy.pub':
    source => 'puppet:///modules/keychain/puppet-deploy.pub',
    owner   => 'vagrant',
    group  => 'vagrant',
  }

}