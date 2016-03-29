class memcached {

  package { 'memcached':
    ensure => 'installed',
  }
  
  file { '/etc/sysconfig/memcached':
      ensure  => file,
      notify  => Service['memcached'],
      content => 'PORT="11211" \n USER="memcached" \n MAXCONN="96" \n CACHESIZE="32" \n OPTIONS=""',
      }
      
  service { 'memcached':
    ensure  => 'running',
    enable  => true,
    require => Package['memcached'],
  }

}
