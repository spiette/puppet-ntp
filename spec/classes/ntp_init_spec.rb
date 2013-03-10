require 'spec_helper'

describe 'ntp' do
  let(:title) { 'ntp' }

  let(:facts) {
    { :osfamily => 'RedHat' }
  }

  describe 'ntp class without any parameters' do 
    let(:params) {{ }}

    it { should create_class('ntp') }
    it { should create_file('/etc/ntp.conf') }
    it {
      should create_file('/etc/ntp.conf')\
      .with_content(/^server pool.ntp.org$/)
    }
  end

  describe 'ntp class with service parameter' do 
    let(:params) {
      { :servers => [
        "0.debian.pool.ntp.org",
        "1.debian.pool.ntp.org",
        "time.nrc.ca",
        ]
      }
    }

    it { should create_class('ntp') }
    it { should create_file('/etc/ntp.conf') }
    it {
      should create_file('/etc/ntp.conf')\
      .with_content(/^server 0.debian.pool.ntp.org$/)\
      .with_content(/^server 1.debian.pool.ntp.org$/)\
      .with_content(/^server time.nrc.ca$/)
    }
    it {
      should create_service('ntpd')
    }
  end
  ['Debian', 'RedHat'].each do |osfamily|
    if osfamily == 'RedHat' 
      it { should create_service('ntpd') }
    else
      it { should create_service('ntp') }
    end
  end
end
