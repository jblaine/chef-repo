include_recipe 'chef-client::config'

#file '/etc/chef/client.d/syslog.rb' do
#  content <<-EOF
#log_location Chef::Log::Syslog.new("chef-client", ::Syslog::LOG_DAEMON)
#EOF
#end
