class users::params {

  $homedir = $::operatingsystem ? {
    solaris => '/dev/null',
    default => '/home',
  }

}
