class Section < ActiveRecord::Base
  has_many :videos
  has_many :comments, :order => 'position DESC'

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end
end
