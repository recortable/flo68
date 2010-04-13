class Section < ActiveRecord::Base
  has_many :videos
  has_many :comments, :order => 'position DESC'
end
