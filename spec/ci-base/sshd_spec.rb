require 'spec_helper'

if os[:family] == 'redhat'
  describe package 'openssh-server' do
    it { is_expected.to be_installed }
  end

  describe service 'sshd' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe port 22 do
    it { is_expected.to be_listening }
  end

  describe file '/etc/ssh/sshd_config' do
    subject { super().content }
    it { is_expected.to match /^Protocol 2$/ }
  end
else
  fail 'OS family is not redhat.'
end
