helpers do

  def javascript_tag(name)
    %{<script type="text/javascript" src="#{asset_path("#{name}.js")}"></script>}
  end

  def stylesheet_tag(name)
    %{<link rel="stylesheet" href="#{asset_path("#{name}.css")}">}
  end

  def image_tag(name, options = {})
    tag :img, options.merge(src: asset_path(name))
  end

  def link_tag(label = nil, href, &block)
    content_tag :a, { href: href }, label, &block
  end

  def tag(name, options = nil)
    %{<#{name}#{attributes(options) if options} />}
  end

  def content_tag(name, options = nil, content = nil, &block)
    content ||= capture_haml(&block) if block_given?
    %{<#{name}#{attributes(options) if options}>#{content}</#{name}>}
  end

  def asset_path(name)
    "/assets/#{sprockets[name].digest}/#{name}"
  end
end

def attributes(options)
  options.map { |key, value|
    if key.to_s == "data" && value.is_a?(Hash)
      value.map { |k, v|
        %{ data-#{k.to_s.dasherize}="#{v}"}
      }.join(" ")
    elsif value == true
      %{ #{key}}
    else
      %{ #{key}="#{value}"}
    end
  }.join
end

def sprockets
  @sprockets ||= Sprockets::Environment.new.tap do |environment|
    environment.append_path "assets/images"
    environment.append_path "assets/javascripts"
    environment.append_path "assets/stylesheets"
  end
end
