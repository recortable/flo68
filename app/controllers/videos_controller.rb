class VideosController < AdminController
  inherit_resources
  belongs_to :section

  def update
    update! { section_videos_path(@section)}
  end

  def create
    create! { section_videos_path(@section)}
  end
end
