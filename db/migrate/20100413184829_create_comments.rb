class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :video
      t.string :body, :length => 1024
      t.string :email
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
