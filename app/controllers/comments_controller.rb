class CommentsController < AdminController
  inherit_resources

  actions :all, :except => [:index, :new]

  def destroy
    destroy! {section_video_video_comments_path(@comment.video.section, @comment.video)}
    expire_video(@comment.video)
  end

  def update
    update! do
      next_comment = Comment.first(:conditions => ["id > ?", @comment.id], :order => 'id')
      if next_comment
        edit_comment_path(next_comment)
      else
        section_video_video_comments_path(@comment.video.section, @comment.video)
      end
    end
    expire_video(@comment.video)
  end
end
