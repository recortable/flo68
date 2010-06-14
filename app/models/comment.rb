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
