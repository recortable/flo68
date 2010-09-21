class CartelsController < AdminController
  inherit_resources

  def update
    update! {cartels_path}
  end

  def create
    create! {cartels_path}
  end
end
