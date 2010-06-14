# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def expire_section(section)
    expire_page :controller => 'pages', :action => 'section', :id => section.name
  end

  def expire_video(video)
    section = video.section
    if section.name == 'intro'
      expire_page :controller => 'pages', :action => 'intro', :id => video
    elsif section.name == 'acciones'
      expire_page :controller => 'pages', :action => 'acciones', :id => video
    else
      expire_page :controller => 'pages', :action => 'section', :id => section.name
    end

  end
end
