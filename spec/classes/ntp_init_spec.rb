require 'spec_helper'

describe 'ntp' do
  let(:title) { 'ntp' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "ntp class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('ntp') }
      it { should create_package('ntp') }
      it { should create_file('/etc/ntp.conf') }
      it {
        should create_file('/etc/ntp.conf')\
        .with_content(/^server pool.ntp.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('ntpd') }
      else
        it { should create_service('ntp') }
      end
    end
    describe "ntp class with service parameter on #{osfamily}" do 
      let(:facts) { { :osfamily => osfamily } }
      let(:params) {
        { :servers => [
          "0.debian.pool.ntp.org",
          "1.debian.pool.ntp.org",
          "time.nrc.ca",
          ]
        }
      }

      it { should create_class('ntp') }
      it { should create_package('ntp') }
      it { should create_file('/etc/ntp.conf') }
      it {
        should create_file('/etc/ntp.conf')\
        .with_content(/^server 0.debian.pool.ntp.org$/)\
        .with_content(/^server 1.debian.pool.ntp.org$/)\
        .with_content(/^server time.nrc.ca$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('ntpd') }
      else
        it { should create_service('ntp') }
      end
    end
  end
end
