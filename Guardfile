guard :bower do
  watch("bower.json")
  watch(".bowerrc")
end

guard :bundler do
  watch("Gemfile")
  watch("Gemfile.lock")
end

guard "process", name: "middleman server", command: "bundle exec middleman server --no-https", stop_signal: "TERM" do
  watch("Gemfile.lock")
end
