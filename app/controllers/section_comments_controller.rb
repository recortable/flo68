class SectionCommentsController < AdminController
  def index
    @section = Section.find(params[:section_id])
    videos = @section.videos
    @comments = Comment.all(:conditions => {:video_id => videos})
  end
end
