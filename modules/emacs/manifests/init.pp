class emacs {
  file { '/tmp/emacs_243.deb':
    source => 'puppet:///modules/emacs/myemacs_243.deb',
  }
  package { "myemacs_243":
    source => '/tmp/emacs_243.deb',
    before => File['/tmp/emacs_243.deb'],
  }
}