class CommentsController < AdminController
  inherit_resources
  belongs_to :section
end
