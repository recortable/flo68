ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'

  # FIXME
  ['intro', 'acciones', 'tutorial', 'faq'].each do |name|
    map.send(name.to_sym, "/#{name}", :controller => 'pages', :action => 'section', :id => name)
  end

  map.resources( :sections, :as => 'secciones', :path_prefix => 'admin' ) do |section|
    section.resources :videos
    section.resources :comments, :as => 'comentarios'
  end
  map.admin '/admin', :controller => 'sections', :action => 'index'
end
