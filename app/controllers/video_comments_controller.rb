class VideoCommentsController < AdminController
  inherit_resources
  belongs_to :video
  defaults :resource_class => Comment, :collection_name => 'comments', :instance_name => 'comment'
end
