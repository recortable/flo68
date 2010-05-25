class CommentsController < AdminController
  inherit_resources
  belongs_to :section

  def index
    @section = Section.find(params[:section_id])
    videos = @section.videos
    @comments = Comment.all(:conditions => {:video_id => videos})
  end

  def update
    update! { section_comments_path(@section)}
  end
end
