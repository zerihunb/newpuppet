##### mailserver subclass

class profile::mailserver {

### installing postfix
 
  class { 'postfix':
    package_ensure => 'latest',
    config_file_template => "postfix/${::operatingsystem}/etc/postfix/main.cf.erb",
    relayhost =>'smtp.ugent.be',
    recipient =>'zerihun.befekadu@ju.edu.et',
#    service_ensure => 'stopped',
  }

}

