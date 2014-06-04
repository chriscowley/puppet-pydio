# == Class pydio::install
#
class pydio::install {
  package { $pydio::package_name:
    ensure  => present,
    require => Class['Yumrepos::pydio'],
  }
}
