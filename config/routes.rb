ActionController::Routing::Routes.draw do |map|
  map.devise_for :users, :as => 'usuarios', :path_names => { :sign_in => 'entrar', :sign_out => 'salir',
    :sign_up => 'registrarse', :password => 'secreto', :confirmation => 'verificar', :unlock => 'desbloquear' }

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
