class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.references :section, :required => true
      t.string :title, :required => true, :length => 200
      t.string :url, :length => 100
      t.string :generator, :default => 'vimeo'
      t.string :preview_file_name
      t.string :preview_content_type
      t.integer :preview_file_size
      t.datetime :preview_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end