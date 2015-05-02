name "unix-base"

description "Shut up"

run_list "recipe[jblaine-chef-client]",
#         "recipe[syslog_handler]",
         "recipe[jblaine-packagemgr]",
         "recipe[jblaine-users]",
         "recipe[python]",
         "recipe[jblaine-git]",
         "recipe[jblaine-terminfo]",
         "recipe[build-essential]",
         "recipe[jblaine-simplepackages]",
         "recipe[bash-CVE-2014-6271]",
         "recipe[bash-CVE-2014-7169]",
         "recipe[ntp]"

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
#override_attributes()
