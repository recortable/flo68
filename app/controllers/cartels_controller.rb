class CartelsController < AdminController
  inherit_resources

  def update
    update! {cartels_path}
  end

  def create
    create! do
      @cartel.touch
      cartels_path
    end
  end
end
