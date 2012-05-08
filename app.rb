#!/usr/bin/env ruby
require "bundler"
Bundler.require

require "mime/types"

get "/*/" do
  redirect to(params[:splat].first), 301
end

get "/assets/:digest/:name" do
  asset = sprockets[params[:name]] or halt 404
  if asset.digest == params[:digest]
    expires 2419200 # 4 weeks
    if mime_type = MIME::Types.of(asset.logical_path).first
      content_type mime_type.to_s
    end
    asset.to_s
  else
    redirect to("/assets/#{asset.digest}/#{asset.logical_path}"), 301
  end
end

get "/" do
  haml :home
end

get "/home" do
  redirect to("/"), 301
end

get "/*" do
  path = params[:splat].first
  if File.exists?("views/#{path}.haml")
    haml path.to_sym
  else
    404
  end
end

not_found do
  haml :"errors/not-found"
end

error do
  haml :"errors/internal-server-error"
end

helpers do

  def javascript_tag(name, options = {})
    content_tag :script, options.merge(type: "text/javascript", src: asset_path("#{name}.js")), ""
  end

  def stylesheet_tag(name, options = {})
    tag :link, options.merge(rel: "stylesheet", media: "screen", type: "text/css", href: asset_path("#{name}.css"))
  end

  def image_tag(name, options = {})
    tag :img, options.merge(src: asset_path(name))
  end

  def link_tag(label, href, options = {}, &block)
    content_tag :a, options.merge(href: href), label, &block
  end

  def tag(name, options = nil)
    capture_haml do
      haml_tag name, options
    end
  end

  def content_tag(name, options = nil, content = nil, &block)
    if block_given?
      haml_tag name, options, &block
      ""
    else
      capture_haml do
        haml_tag name, content, options
      end
    end
  end

  def asset_path(name)
    if asset = sprockets[name]
      "/assets/#{asset.digest}/#{name}"
    else
      ""
    end
  end

  def snippet(name)
    haml name.to_sym
  end
end

def sprockets
  @sprockets ||= Sprockets::Environment.new.tap do |environment|
    environment.append_path "assets/images"
    environment.append_path "assets/javascripts"
    environment.append_path "assets/stylesheets"
  end
end
