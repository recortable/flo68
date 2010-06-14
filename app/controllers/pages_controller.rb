class PagesController < ApplicationController
  layout 'pages'
  caches_page :index, :intro, :acciones, :section
  protect_from_forgery :except => [:add_comment]

  def index
    redirect_to intro_path
  end

  def add_comment
    @comment = Comment.new(params[:comment])
    @video = @comment.video
    @section = @video.section
    expire_video(@video)
    if @comment.save
      redirect_to :action => @section.name, :id => @video
    else
      render :action => @section.name
    end
  end

  def section
    @section = Section.find_by_name(params[:id])
    @video = @section.videos.first
    @comment = Comment.new(:video => @video)
    render :action => @section.name
  end

  def intro
    @section = Section.find_by_name('intro')
    @video = Video.find(params[:id])
    @comment = Comment.new(:video => @video)
    render :action => 'intro'
  end

  def acciones
    @section = Section.find_by_name('acciones')
    @video = Video.find(params[:id])
    @comment = Comment.new(:video => @video)
    render :action => 'acciones'
  end


end
