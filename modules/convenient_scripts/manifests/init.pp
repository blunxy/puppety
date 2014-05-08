class convenient_scripts {
  file { '/usr/local/bin/papply':
    source  => 'puppet:///modules/convenient_scripts/papply.sh',
    mode    => '0755',
  }
}