class Video < ActiveRecord::Base
  belongs_to :section
  has_attached_file :preview
end
