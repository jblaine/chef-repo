# Test Sean's line cookbook stuff

replace_or_add "spread the love" do
  path "/etc/hosts"
  pattern "# Why hello there.*"
  line "# Why hello there, you beautiful person, you."
end

replace_or_add "example" do
  path "/etc/hosts"
  pattern "# Line.*"
  line "# Line to delete via delete_lines"
end

delete_lines "example 2" do
  path "/etc/hosts"
  pattern "# Line to delete.*"
end
