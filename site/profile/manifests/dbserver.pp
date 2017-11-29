### dbserver subclass definition 

class profile::dbserver ($rootpassword){                          ### passing a root password parameter to be treated out of dbservers

### installing mysql 

  class { '::mysql::server':
   # root_password           => 'strongpassword',                 ### instede of using root passowrd for all dbservers
     root_password           => $profile::dbserver::rootpassword, ### now u can use this parameter
     remove_default_accounts => true,
  
}

### creating a judb DB and a User papa
  mysql::db { 'judb':
  user     => 'papa',
  password => '$6$SejiiOcexU1Wqt$.AtN94ajiOzGTO4Wlph5O.ScXSo0Qi3JR8VG0JW3zmaWFMXqmUmDx5jG8VYjM6aVfDUJMfYhwYqHdDVXzTpjk.',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
  import_timeout => 200,
  }

}



