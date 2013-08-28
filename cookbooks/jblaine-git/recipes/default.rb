if platform?('solaris2')
  include_recipe 'jblaine-curl'

  remote_file "#{Chef::Config['file_cache_path']}/git.tar.gz" do
    source "https://git-core.googlecode.com/files/git-1.8.4.tar.gz"
    mode 00644
    not_if "test -f #{Chef::Config['file_cache_path']}/git.tar.gz"
    notifies :run, 'script[buildgit]', :immediately
  end

  script 'buildgit' do
    interpreter 'bash'
    flags '-x'
    cwd Chef::Config['file_cache_path']
    code <<-COMMANDS
      PATH=/usr/sfw/bin:/usr/ccs/bin:/usr/bin:/bin:/usr/sbin:/sbin
      LDFLAGS="-R/usr/sfw/lib -L/usr/sfw/lib"
      gtar -zxf git.tar.gz
      cd git-1.8.4 && ./configure --prefix=/usr --with-curl --with-openssl && gmake install
    COMMANDS
    creates "/usr/bin/git"
  end
else
  include_recipe 'git'
end
