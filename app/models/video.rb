# == Schema Information
# Schema version: 20100525151440
#
# Table name: videos
#
#  id                     :integer(4)      not null, primary key
#  section_id             :integer(4)
#  title                  :string(255)
#  url                    :string(255)
#  generator              :string(255)     default("vimeo")
#  animation_file_name    :string(255)
#  animation_content_type :string(255)
#  animation_file_size    :integer(4)
#  animation_updated_at   :datetime
#  preview_file_name      :string(255)
#  preview_content_type   :string(255)
#  preview_file_size      :integer(4)
#  preview_updated_at     :datetime
#  position               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class Video < ActiveRecord::Base

  GENERATORS = ['youtube limpio', 'youtube', 'movshare', 'vimeo', 'embed', 'no-disponible']

  belongs_to :section
  has_many :comments
  has_attached_file :preview
  has_attached_file :animation
  acts_as_list :scope => :section_id

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
