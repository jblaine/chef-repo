# Test Sean's line cookbook stuff

replace_or_add "spread the love" do
  path "/etc/hosts"
  pattern "# Why hello there.*"
  line "# Why hello there, you beautiful person, you."
end
