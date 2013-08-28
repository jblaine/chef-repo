case node['platform_family']
  when 'solaris2'
    default['jblaine-users']['homedir'] = '/export/home/jblaine'
  else
    default['jblaine-users']['homedir'] = '/home/jblaine'
end
