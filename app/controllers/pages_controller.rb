class PagesController < ApplicationController
  layout 'pages'

  def index
    redirect_to intro_path
  end

  def section
    @section = Section.find_by_name(params[:id])
    render :action => @section.name
  end

end
