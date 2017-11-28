class profile::databases {

### installing mysql 

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }

### creating a DB and a User papa
  mysql::db { 'judb':
  user     => 'papa',
  password => 'paspapa',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
  import_timeout => 200,
  }

}


