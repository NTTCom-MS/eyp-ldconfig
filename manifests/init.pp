class ldconfig(
                $manage_package        = true,
                $package_ensure        = 'installed',
                $manage_service        = true,
                $manage_docker_service = true,
                $service_ensure        = 'running',
                $service_enable        = true,
              ) inherits ldconfig::params{
  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  exec{ 'eyp-ldconfig':
    command     => 'ldconfig',
    refreshonly => true,
  }

}
