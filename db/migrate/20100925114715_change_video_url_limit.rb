class ChangeVideoUrlLimit < ActiveRecord::Migration
  def self.up
    change_column :videos, :url, :string, :limit => 512
  end

  def self.down
  end
end
