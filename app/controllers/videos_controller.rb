class VideosController < AdminController
  inherit_resources
  belongs_to :section
end
