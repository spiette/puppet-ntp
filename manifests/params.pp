# This class is meant to be called from ntp
# It set platform specific values
class ntp::params {
  $pkgname = 'ntp'
  $conffile = '/etc/ntp.conf'
  $service = $::osfamily ? {
    'Debian' => 'ntp',
    'RedHat' => 'ntpd',
    default  => fail('unsupported platform')
  }
}

