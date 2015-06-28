
file '/etc/ssh/sshd_config' do
  action :edit
  block do |content|
    content.gsub! /^\s*#\s*Protocol\s+\d+\s*$/, 'Protocol 2'
  end
end
