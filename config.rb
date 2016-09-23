activate :livereload

activate :automatic_image_sizes

activate :directory_indexes

activate :autoprefixer

activate :sprockets
sprockets.append_path(File.join(root, "vendor/bower"))

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

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :imageoptim
  activate :asset_hash
  activate :gzip
end

data.team.members.each do |slug, member|
  proxy "/team/#{slug}/index.html", "/team/member-template.html", locals: member, ignore: true
end
