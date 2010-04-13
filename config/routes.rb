ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'

  ['intro', 'acciones', 'tutorial', 'faq'].each do |name|
    map.send(name.to_sym, "/#{name}", :controller => 'pages', :action => 'section', :id => name)
  end
end
