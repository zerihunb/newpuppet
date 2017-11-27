node 'stretch' {
  class { 'apt':
    update => {
      'frequency' => 'always',
    },
    purge  => {
      'sources.list'   => true,
      'sources.list.d' => true,
      'preferences'    => true,
      'preferences.d'  => true,
    },
  }

  apt::source { 'puppetlabs':
    location => 'http://apt.puppetlabs.com',
    repos    => 'puppet5',
    key      => {
      'id'     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
      'server' => 'pgp.mit.edu',
    },
  }

  if($facts[operatingsystem] == 'Debian') {
    apt::source { 'debian':
      ensure   => 'present',
      location => 'http://ftp.be.debian.org/debian',
      repos    => 'main non-free contrib',
    }
  }

  if($facts[operatingsystem] == 'Ubuntu') {
    apt::source { 'ubuntu':
      ensure   => 'present',
      location => 'http://be.archive.ubuntu.com/ubuntu/',
      repos    => 'main restricted universe multiverse ',
    }
}
 accounts::user { 'dan': 
  ensure   => 'present',
  uid      => '4001',
  gid      => '4001',
  group    => 'staff',
  shell    => '/bin/bash',
  password => '!!',
  locked   => false,
  }
}
