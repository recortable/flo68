class CreateCartels < ActiveRecord::Migration
  def self.up
    create_table :cartels do |t|
      t.string :title
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :position
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end

  def self.down
    drop_table :cartels
  end
end
