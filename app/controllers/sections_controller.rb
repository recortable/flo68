class SectionsController < AdminController
  inherit_resources

  def update
    update! 
    expire_page :controller => 'pages', :action => 'section', :id => @section.name
  end

end
