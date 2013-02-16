class users {

  include users::params

  file {
    home-dir:
      path => $users::params::homedir,
      ensure => directory,
      owner => 0,
      group => 0,
      mode  => 0755;
  }
}
