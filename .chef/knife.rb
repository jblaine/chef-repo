current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jblaine"
client_key               "#{current_dir}/jblaine.pem"
validation_client_name   "jblaine-validator"
validation_key           "#{current_dir}/jblaine-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/jblaine"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
