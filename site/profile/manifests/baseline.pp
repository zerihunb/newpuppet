class profile::baseline {
  class {'apt':
}    
  package { 'vim':
    ensure =>present,
 }
}
