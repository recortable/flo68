ActionController::Routing::Routes.draw do |map|
  map.devise_for :users, :as => 'usuarios', :path_names => { :sign_in => 'entrar', :sign_out => 'salir',
    :sign_up => 'registrarse', :password => 'secreto', :confirmation => 'verificar', :unlock => 'desbloquear' }

  map.root :controller => 'pages', :action => 'index'

  ['intro', 'acciones', 'tutorial', 'faq'].each do |name|
    map.send(name.to_sym, "/#{name}", :controller => 'pages', :action => 'section', :id => name)
  end
  map.add_comment '/comentar', :controller => 'pages', :action => 'add_comment', :conditions => {:method => :post}
  map.connect '/intro/:id', :controller => 'pages', :action => 'intro'
  map.connect '/acciones/:id', :controller => 'pages', :action => 'acciones'

  map.resources( :sections, :as => 'sec', :path_prefix => 'admin' ) do |section|
    section.resources :videos do |video|
      video.resources :video_comments, :as => 'comentarios'
    end
    section.resources :section_comments, :as => 'comentarios'
  end
  map.resources(:comments, :as => 'comentarios', :path_prefix => 'admin')
  map.resource(:videos_tutorial, :controller => 'tutorials', :path_prefix => 'admin')

  map.admin '/admin', :controller => 'sections', :action => 'index'
  map.resources :cartels, :as => 'carteles', :path_prefix => 'admin'
end
