case node['platform_family']
when 'rhel'
  include_recipe "yum"
  include_recipe "yum-epel"
when 'debian'
  include_recipe "apt"
end
