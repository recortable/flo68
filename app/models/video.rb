class Video < ActiveRecord::Base
  belongs_to :section
  has_many :comments
  has_attached_file :preview
  has_attached_file :animation
  acts_as_list :scope => :section

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
