default['jenkins']['server']['home'] = 'C:/Program Files (x86)/Jenkins'

# The Windows 'DisplayVersion' of the installed package (determined
# by installing it once). The windows_package resource needs this
# to properly determine if Jenkins is installed already or not
default['jenkins']['server']['win_displayversion'] = '0.1.517'

default['jenkins']['server']['version'] = '1.517'

default['jenkins']['server']['plugins'] = %w{ git }
