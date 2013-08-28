yum_repository "flooflaa" do
  proxy "http://shutyoface.com"
  description "Stable repo"
  url "http://dev.zenoss.com/yum/stable/"
  action :add
end
