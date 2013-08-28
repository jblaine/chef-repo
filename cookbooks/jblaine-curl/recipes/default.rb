if platform?('solaris2')
  # cURL will vomit on https sites without a modern CA cert bundle,
  # so we snarf the Mozilla ones extracted by the cURL team. Hardly
  # the most trustworthy thing to do, but fuck it, this recipe is
  # a hack for Solaris 10 anyway.
  remote_file '/etc/cacert.pem' do
    source 'http://curl.haxx.se/ca/cacert.pem'
    mode 00644
    not_if "test -f /etc/cacert.pem"
  end

  # Git is worthless without cURL for https. How do you like my
  # hardcoded URL? Sweet.
  remote_file "#{Chef::Config['file_cache_path']}/curl.tar.gz" do
    source 'http://curl.haxx.se/download/curl-7.32.0.tar.gz'
    mode 00644
    not_if "test -f #{Chef::Config['file_cache_path']}/curl.tar.gz"
    notifies :run, 'script[buildcurl]', :immediately
  end

  script 'buildcurl' do
    interpreter 'bash'
    flags '-x'
    cwd Chef::Config['file_cache_path']
    code <<-COMMANDS
      PATH=/usr/sfw/bin:/usr/ccs/bin:/usr/bin:/bin:/usr/sbin:/sbin
      gtar -zxf curl.tar.gz
      cd curl-7.32.0 && ./configure --prefix=/usr --with-ca-bundle=/etc/cacert.pem --with-ssl=/usr/sfw && gmake install
    COMMANDS
    creates "/usr/bin/curl"
  end

else
  package 'curl' # seems legit... :|
end
