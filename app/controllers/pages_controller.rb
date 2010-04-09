class PagesController < ApplicationController
  layout 'pages'

  def index
    redirect_to intro_path
  end

end
