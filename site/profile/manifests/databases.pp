class profile::databases {
  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }
}


