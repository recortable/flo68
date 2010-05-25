class Comment < ActiveRecord::Base
  belongs_to :video
  has_one :section, :through => :video
  default_scope :order => :created_at
end
