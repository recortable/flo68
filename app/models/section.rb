class Section < ActiveRecord::Base
  has_many :videos

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end
end
