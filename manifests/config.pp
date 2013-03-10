# This class is meant to be called from ntp
# it bakes the configuration file
class ntp::config(
    $servers=$ntp::servers,
    $options=$ntp::options,
    ) {
  include ntp::params
  file { $ntp::params::conffile:
    ensure  => present,
    mode    => '0440',
    content => template('ntp/ntp.conf.erb')
  }
}

