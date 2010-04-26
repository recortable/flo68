class CommentsController < AdminController
  inherit_resources
  belongs_to :section

  def update
    update! { section_comments_path(@section)}
  end
end
