define ldconfig::diradd (
                          $path  = $name,
                          $type  = 'default',
                          $order = '28',
                        ) {

  include ::ldconfig

  if(! defined(Concat["/etc/ld.so.conf.d/${type}.conf"]))
  {
    concat { "/etc/ld.so.conf.d/${type}.conf":
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      notify => Exec['eyp-ldconfig'],
    }

    concat::fragment{ "/etc/ld.so.conf.d/${type}.conf header":
      target  => "/etc/ld.so.conf.d/${type}.conf",
      order   => '00',
      content => "# puppet managed file\n",
    }
  }

  concat::fragment{ "/etc/ld.so.conf.d/${type}.conf ${path}":
    target  => "/etc/ld.so.conf.d/${type}.conf",
    order   => $order,
    content => "${path}\n",
  }

}
