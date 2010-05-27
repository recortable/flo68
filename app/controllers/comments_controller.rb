class CommentsController < AdminController
  inherit_resources

  actions :all, :except => [:index, :new]

  def destroy
    destroy! {section_video_video_comments_path(@comment.video.section, @comment.video)}
  end

  def update
    update! { section_video_video_comments_path(@comment.video.section, @comment.video)}
  end
end
