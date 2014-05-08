class emacs {
  package { "my-emacs":
    provider => "dpkg",
    source => 'puppet:///modules/emacs/myemacs_243.deb',
  }
}