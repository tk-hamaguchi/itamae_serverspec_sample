require 'spec_helper'

if os[:family] == 'redhat'
  describe package 'jenkins' do
    it { is_expected.to be_installed }
  end

  describe service 'jenkins.service' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe port 8009 do
    it { is_expected.to be_listening }
  end

  describe port 8080 do
    it { is_expected.to be_listening }
  end
else
  fail 'OS family is not redhat.'
end
