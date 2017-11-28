class profile::databases {

### installing mysql 

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }

### creating a DB and a User papa
  mysql::db { 'judb':
  user     => 'papa',
  password => '$6$R8I0w17ICLy$hewRkKSfktt.WzSATeSZBnDAxGMckdxKXZfH/TDFI6apK0XcpkO7EEC952ZMzkumgKHF7bjUvNUMWABzyABCs0',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
  import_timeout => 200,
  }

}


