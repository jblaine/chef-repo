# This file is the companion recipe to the ChefSpec tests in ../spec

testfile = "/tmp/.line-cookbook-testfile"

# Prime the file

file "0" do
  path testfile
  content "An opening line"
  owner 'root'
  group 'root'
  mode '00644'
end

# File contents now:
# An opening line

replace_or_add "1" do
  path testfile
  pattern "^An opening"
  line "A replaced opening line"
end

# File contents now:
# A replaced opening line

replace_or_add "2" do
  path testfile
  pattern "ABCDEFG"
  line "An added line"
end

# File contents now:
# A replaced opening line
# An added line

delete_lines "3" do
  path testfile
  pattern "An added line"
end

replace_or_add "FINAL_FILE" do
  path testfile
  pattern "^A replaced opening line$"
  line "A replaced opening line after another was deleted"
end

# File contents now:
# A replaced opening line after another was deleted
