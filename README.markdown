# ntp
[![Build Status](https://travis-ci.org/spiette/puppet-ntp.png?branch=master)](https://travis-ci.org/spiette/puppet-ntp)

This is the ntp module. It will default to sync with pool.ntp.org. You can give
a server list to sync to. It will also take any arbitrary options.

# Usage

    class { 'ntp':
      servers => [
        '0.debian.pool.ntp.org',
        '1.debian.pool.ntp.org',
      ],
      options => { 'disable' => 'auth' }
    }

# License
Apache License, Version 2.0


# Contact
Simon Piettte <piette.simon@savoirfairelinux.com>


# Support
Please log tickets and issues at [github](http://github.com/spiette/spiette-ntp)
