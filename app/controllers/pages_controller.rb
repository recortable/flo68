class PagesController < ApplicationController
  layout 'pages'

  def index
    redirect_to intro_path
  end

  def section
    @section = Section.find_by_name(params[:id])
    @video = @section.videos.first
    render :action => @section.name
  end

  def intro
    @section = Section.find_by_name('intro')
    @video = Video.find(params[:id])
    render :action => 'intro'
  end

  def acciones
    @section = Section.find_by_name('acciones')
    @video = Video.find(params[:id])
    render :action => 'acciones'
  end


end
