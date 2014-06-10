# == Class pydio::install
#
class pydio::install {
  case $::osfamily {
    'RedHat', 'Amazon': {
      yumrepo { 'pydio-stable':
        baseurl   => "http://dl.ajaxplorer.info/repos/el${::os_maj_version}/pydio-stable",
        enabled   => 1,
        gpgcheck  => 1,
        gpgkey    => 'http://dl.ajaxplorer.info/repos/charles@ajaxplorer.info.gpg.key',
      }
    }
#    'Debian': {
#      apt::source { 'pydio':
#        location          => 'http://dl.ajaxplorer.info/repos/apt',
#        release           => 'stable',
#        repos             => 'main',
#        required_packages => 'debian-keyring debian-archive-keyring',
#        key               => '11FFD694',
#        key_source        => 'http://dl.ajaxplorer.info/repos/charles@ajaxplorer.info.gpg.key',
#      }
#    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  package { $pydio::package_name:
    ensure  => present,
  }
}
