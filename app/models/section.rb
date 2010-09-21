# == Schema Information
# Schema version: 20100525151440
#
# Table name: sections
#
#  id         :integer(4)      not null, primary key
#  name       :string(32)
#  title      :string(128)
#  body       :string(4096)
#  video      :string(1024)
#  created_at :datetime
#  updated_at :datetime
#

class Section < ActiveRecord::Base
  has_many :videos

  def to_param
    name ? "#{id}-#{name.parameterize}" : id.to_s
  end
end
