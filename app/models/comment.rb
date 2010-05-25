class Comment < ActiveRecord::Base
  belongs_to :video
  has_one :section, :through => :video
  acts_as_list :scope => :section
end
