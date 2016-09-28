bower_path = File.join(root, "vendor/bower")

activate :automatic_image_sizes
activate :directory_indexes
activate :sprockets
sprockets.append_path(bower_path)

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/default"

require "slim"
set :slim, pretty: true

require "sass"
::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max
::Sass.load_paths << bower_path unless ::Sass.load_paths.include?(bower_path)

configure :development do
  # activate :autoprefixer
  activate :livereload, apply_js_live: false
end

configure :build do
  activate :autoprefixer
  activate :minify_css
  activate :minify_javascript
  activate :imageoptim
  activate :asset_hash
  activate :gzip
end

data.team.members.each do |slug, member|
  proxy "/team/#{slug}/index.html", "/team/member-template.html", locals: member, ignore: true
end
