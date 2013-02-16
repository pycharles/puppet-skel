define users::user (
  $ensure = '',
  $managehome = true,
  $ssh_public_keys = '',
  $no_ssh_private_key = false,
  $comment = '',
  $gid = $title,
  $groups = [],
) {

  include users
  include users::params

  $home = "${users::params::homedir}/${name}"
  $ssh_dir = "$home/.ssh"

  group { $name:
    ensure => $ensure,
    require => Class['users'],
  }

  user {$name:
    ensure => $ensure,
    home => $home,
    managehome => $managehome,
    gid => $gid,
    groups => $groups,
    require => Group[$gid],
  }
  
  file { 
    $home:
      ensure => $ensure ? {absent => undef, default => directory },
      owner => $name,
      group => $gid,
      recurse => true,
      require => User[$name];
    $ssh_dir:
      ensure => $ensure ? {absent => undef, default => directory },
      owner => $name,
      group => $gid,
      mode => '700',
      require => File[$home];
    "${ssh_dir}/authorized_keys":
      ensure => $ensure,
      owner => $name,
      group => $gid,
      mode => '600',
      content => $ssh_public_keys,
      require => File[$ssh_dir];

  }


}

