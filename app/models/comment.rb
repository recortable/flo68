class Comment < ActiveRecord::Base
  belongs_to :video
  has_one :section, :through => :video
  default_scope :order => 'published_at DESC'
  before_save :publish

  validates_presence_of :author, :email, :body, :video_id

  private
  def publish
    self.published_at = Time.now if self.published_at.nil?
  end
end
