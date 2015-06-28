require 'spec_helper'

if os[:family] == 'redhat'
  describe package 'mariadb' do
    it { is_expected.to be_installed }
  end

  describe package 'mariadb-devel' do
    it { is_expected.to be_installed }
  end

  describe package 'mariadb-libs' do
    it { is_expected.to be_installed }
  end

  describe package 'mariadb-server' do
    it { is_expected.to be_installed }
  end

  describe service 'mariadb.service' do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end

  describe port 3306 do
    it { is_expected.to be_listening }
  end
else
  fail 'OS family is not redhat.'
end
