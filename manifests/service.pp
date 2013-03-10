# This class is meant to be called from ntp
# It ensure the service is running
class ntp::service {
  include ntp::params
  service { $ntp::params::service:
    ensure => running,
    enable => true,
  }
}
