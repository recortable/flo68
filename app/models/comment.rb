# == Schema Information
# Schema version: 20100525151440
#
# Table name: comments
#
#  id           :integer(4)      not null, primary key
#  video_id     :integer(4)
#  body         :string(255)
#  email        :string(255)
#  author       :string(255)
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :video
  has_one :section, :through => :video
  default_scope :order => 'published_at DESC'
  before_save :publish

  validates_presence_of :author, :email, :body, :video_id

  def next_comment
    @next_comment ||= Comment.first(:conditions => ["id > ?", self.id], :order => 'id')
  end

  def prev_comment
    @prev_comment ||= Comment.first(:conditions => ["id < ?", self.id], :order => 'id DESC')
  end

  private
  def publish
    self.body.strip! if self.body
    self.published_at = Time.now if self.published_at.nil?
  end
end
