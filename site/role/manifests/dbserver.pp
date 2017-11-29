class role::dbserver {
  include ::profile::baseline
  #include ::profile::dbserver
  class { '::profile::dbserver':
    rootpassword =>'$6$IPoQfnW4$0RuhnizKkka0NHE4jiGG2YqaF/ryEQTfanLx2vkQqRTQkZvNZa14K9V2frqOP2.SoYo9n3vcSZlr2yFAh6s5j/',
  } 
  include ::profile::mailserver
}


