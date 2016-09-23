guard :bower do
  watch("bower.json")
  watch(".bowerrc")
end

guard :bundler do
  require "guard/bundler"
  require "guard/bundler/verify"
  helper = Guard::Bundler::Verify.new

  files = ["Gemfile"]
  files += Dir["*.gemspec"] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end

# This is an example with all options that you can specify for guard-process
guard "process", name: "middleman server", command: "bundle exec middleman server --no-https", stop_signal: "KILL" do
  watch("Gemfile.lock")
end
