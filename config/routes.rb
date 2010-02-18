ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'
  map.sucursal '/sucursal', :controller => 'pages', :action => 'sucursal'
  map.agentes '/agentes', :controller => 'pages', :action => 'agentes'
  map.elpalo '/elpalo', :controller => 'pages', :action => 'elpalo'
  map.lapasta '/lapasta', :controller => 'pages', :action => 'lapasta'
end
