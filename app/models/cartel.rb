# == Schema Information
# Schema version: 20100525151440
#
# Table name: cartels
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  position           :string(255)
#  width              :integer(4)
#  height             :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

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
