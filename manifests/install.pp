# This class is meant to be called from ntp
# It just install the package
class ntp::install {
  include ntp::params
  package { $ntp::params::pkgname:
    ensure => present,
  }
}
