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
  # This sucks because it's not based on SSH due to not having
  # private key (whole encrypted data bag chicken and egg nightmare)
  # Can't push from this local repo w/o GH username + password :|
  repository 'https://github.com/jblaine/dotfiles.git'
end

git "#{node['jblaine-users']['homedir']}/liquidprompt" do
 user 'jblaine'
 repository 'https://github.com/rfnash/liquidprompt.git'
end

%w{ .bashrc .bash_profile .vimrc .vim .liquidpromptrc }.each do |l|
  link "#{node['jblaine-users']['homedir']}/#{l}" do
    owner 'jblaine'
    to "#{node['jblaine-users']['homedir']}/dotfiles/#{l}"
  end
end
