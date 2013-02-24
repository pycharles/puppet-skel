class role_common {
  include common_users
  class { 'sudo': }
  sudo::conf {'wheel':
    content => '%wheel ALL=(ALL) NOPASSWD: ALL',
  }
  class { 'ntp': 
    server_list => [ 'puppet' ],
  }
}

class role_puppetslave inherits role_common {
  class { 'ntp': }

}
