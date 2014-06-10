# == Class: pydio
#
# Install Pydio
#
# === Parameters
#
#   None for now
#
class pydio (
  $package_name = $pydio::params::package_name,
  $service_name = $pydio::params::service_name,
) inherits pydio::params {

  # validate parameters here

  class { 'pydio::install': } ->
  class { 'pydio::config': } ->
  class { 'pydio::selinux': }
}
