# == Class: ntp
#
# This ntp class is the entry point. It will manage ISC ntp within Debian
# and RedHat famility distributions.
#
# === Parameters
#
# Document parameters here.
#
# [*servers*]
# Specify one or more upstream ntp servers as an array. Module default is
# pool.ntp.org
#
# [*options*]
# Speficy any options and it will be added to the configuration file. There's
# no sanity check, so make sure you know what you're doing.
#
# === Examples
#
#  class { ntp:
#    servers => [
#      'pool.ntp.org',
#      'ntp.local.company.com'
#    ],
#    options => {
#      'disable' => 'auth',
#    },
#  }
#
# When using hiera with 3.x:
# ---
# class:
#   - ntp
# ---
# ntp::servers:
#   - pool.ntp.org
#   - time.nrc.ca
# ntp::options:
#   :disable: auth
#
# === Authors
#
# Simon Piette <simon.piette@savoirfairelinux.com>
#
# === Copyright
#
# Copyright 2013 Simon Piette
#
#
class ntp (
  $servers = [ 'pool.ntp.org' ],
  $options = {},
  ) {

  Class["${module_name}::install"]->
  Class["${module_name}::config"]~>
  Class["${module_name}::service"]
  include ntp::install
  include ntp::config
  include ntp::service
}
