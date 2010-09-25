class TutorialsController  < AdminController
  inherit_resources
  actions :show, :update, :edit

  def show
    @tutorial = Tutorial.first
    show!
  end

  def update
    @tutorial = Tutorial.first
    update! { videos_tutorial_path }
  end

  def edit
    @tutorial = Tutorial.first
    edit!
  end
end
