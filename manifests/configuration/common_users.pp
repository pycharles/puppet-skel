class common_users {

  users::user {
    bill: ensure => absent,
  } 

  users::user {
    charles:
      ensure => present,
      no_ssh_private_key => true,
      groups => ['users','wheel'],
      ssh_public_keys => [
        'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAz1sesNbsdtwT5Tlp2Kt3GNIEixAn/lCtPQzZy42MvrnNp4/fFwVIfsM9/Yaq4xFsCE5dKwMHYrzAnxuIgmGwq5K7U2CTXbwwwm0CXOuzp7iy1L1Pe1E+sfy2Ha05zJFXUCDGcYVo1oypUmcQaKVKPTDuYxcZI2jPQP3sa8e5j8arfUzJzzYsiyflg1o/634WLiXixoAE2P6UvIXyGzIJ98mmX56aJsR0EjsgXY1cK/PRGvPX0Vs9AvHWpvt1xeW8kaPS1ATGUbgks+9TGVQsQRhkKZbdU9wVYd41m5Fr3VUWxcnpKnoprbANaCbuaIaIh0jgaJoOGGzjMNgGjnARSQ=='
      ];


  }
}
