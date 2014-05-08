class emacs {
  package { "myemacs_243":
    provider => "dpkg",
    source => 'puppet:///modules/emacs/myemacs_243.deb',
  }
}