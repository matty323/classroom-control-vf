class memcached {

  package { 'memcached':
    ensure => 'installed',
  }
  
  file { '/etc/sysconfig/memcached':
      ensure  => file,
      notify  => Service['memcached'],
      content => 'PORT="11211" USER="memcached" MAXCONN="96" CACHESIZE="32" OPTIONS=""',
      }
      
  service { 'memcached':
    ensure  => 'running',
    enable  => true,
    require => Package['memcached'],
  }

}
