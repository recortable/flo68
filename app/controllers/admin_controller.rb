
class AdminController < ApplicationController
  layout 'admin'
  before_filter :load_sections

  private
  def load_sections
    @sections = Section.all
  end
end
