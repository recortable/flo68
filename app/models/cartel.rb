class Cartel < ActiveRecord::Base
  default_scope :order => :position
  acts_as_list
  has_attached_file :image, :styles => { :thumb => "100x100>" }
  before_save :save_dimensions

  private
  def save_dimensions
    if image.image?
      self.width = image.width
      self.height = image.height
    end
  end
end
