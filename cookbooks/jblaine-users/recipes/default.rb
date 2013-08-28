return if platform?('windows')

# Ensure git is installed
include_recipe 'jblaine-git'

group 'jblaine' do
  gid 500
end

user 'jblaine' do
  uid 500
  gid 500
  comment 'Jeff Blaine'
  shell '/bin/bash'
  home "#{node['jblaine-users']['homedir']}"
end

git "#{node['jblaine-users']['homedir']}/dotfiles" do
  user 'jblaine'
  # This sucks because not based on SSH due to not having
  # private key (whole encrypted data bag chicken and egg nightmare)
  # Can't push from this local repo w/o GH username + password :|
  repository 'https://github.com/jblaine/dotfiles.git'
  notifies :run, 'script[linkdotfiles]', :immediately
end

# Quick hack instead of a bunch of 'link' resources
script 'linkdotfiles' do
  action :nothing
  user 'jblaine'
  interpreter 'bash'
  code <<-EOH
    ln -sf #{node['jblaine-users']['homedir']}/dotfiles/.bashrc #{node['jblaine-users']['homedir']}/.bashrc
    ln -sf #{node['jblaine-users']['homedir']}/dotfiles/.bash_profile #{node['jblaine-users']['homedir']}/.bash_profile
    ln -sf #{node['jblaine-users']['homedir']}/dotfiles/.vimrc #{node['jblaine-users']['homedir']}/.vimrc
    ln -sf #{node['jblaine-users']['homedir']}/dotfiles/.vim #{node['jblaine-users']['homedir']}/.vim
  EOH
end
