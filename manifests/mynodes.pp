node 'stretch'{
  include ::role::dbserver
}


node 'stretch_old' {
  class { 'apt':
    update => {
      'frequency' => 'always',
    },

### remove source lists that is not manage by puppet

    purge  => {
      'sources.list'   => true,
      'sources.list.d' => true,
      'preferences'    => true,
      'preferences.d'  => true,
    },
  }

### rsync packege install

  class { 'rsync': 
    package_ensure => 'latest' 
  }
  rsync::get { '/foo':
    source  => "rsync://${rsyncServer}/repo/foo/",
#    require => File['/foo'],
  }
  rsync::put { '${rsyncDestHost}:/repo/foo':
    user    => 'dan',
    source  => "/repo/foo/",
  }

### postfix
# you can do like class { '::postfix':
  class { 'postfix':
    package_ensure => 'latest',
    config_file_template => "postfix/${::operatingsystem}/etc/postfix/main.cf.erb",
    relayhost =>'smtp.ugent.be',
    recipient =>'zerihun.befekadu@ju.edu.et',
#    service_ensure => 'stopped',
  }

#### NTP server

  class { 'ntp':
    server_list => [ '0.be.pool.ntp.org', '1.be.pool.ntp.org'],
  }

### install vim package

  package { 'vim':
    ensure => absent,
  }

#### adding puppet esource
  apt::source { 'puppetlabs':
    location => 'http://apt.puppetlabs.com',
    repos    => 'puppet5',
    key      => {
      'id'     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
      'server' => 'pgp.mit.edu',
    },
  }

#### source list for debian

  if($facts[operatingsystem] == 'Debian') {
    apt::source { 'debian':
      ensure   => 'present',
      location => 'http://ftp.be.debian.org/debian',
      repos    => 'main non-free contrib',
    }
  }

#### source list for ubuntu

  if($facts[operatingsystem] == 'Ubuntu') {
    apt::source { 'ubuntu':
      ensure   => 'present',
      location => 'http://be.archive.ubuntu.com/ubuntu/',
      repos    => 'main restricted universe multiverse ',
    }
}

##### managing user account

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
