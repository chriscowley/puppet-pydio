# == Class pydio::params
#
# This class is meant to be called from pydio
# It sets variables according to platform
#
class pydio::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pydio'
      $service_name = 'pydio'
    }
    'RedHat', 'Amazon': {
      $package_name = 'pydio'
      $service_name = 'pydio'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
