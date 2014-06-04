require 'spec_helper'

describe 'pydio' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "pydio class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('pydio::params') }
        it { should contain_class('pydio::install').that_comes_before('pydio::config') }
        it { should contain_class('pydio::config') }
        it { should contain_class('pydio::service').that_subscribes_to('pydio::config') }

        it { should contain_service('pydio') }
        it { should contain_package('pydio').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'pydio class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('pydio') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
