class ChangeVideoUrlLimitAgain < ActiveRecord::Migration
  def self.up
    change_column :videos, :url, :string, :limit => 1024
  end

  def self.down
  end
end
