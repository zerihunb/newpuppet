class profile::databases {
  class { '::mysql::server':
#    ensure =>absent,
    root_password           => 'strongpassword',
    remove_default_accounts => true,
#    override_options        => $override_options
  }
}


