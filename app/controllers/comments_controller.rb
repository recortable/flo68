class CommentsController < AdminController
  inherit_resources

  actions :all, :except => [:index, :new]

  def destroy
    destroy! {section_video_video_comments_path(@comment.video.section, @comment.video)}
    expire_video(@comment.video)
  end

  def update
    update! do
      edit_comment_path(@comment)
        #section_video_video_comments_path(@comment.video.section, @comment.video)
    end
    expire_video(@comment.video)
  end
end
