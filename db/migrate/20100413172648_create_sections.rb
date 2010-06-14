class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name, :limit => 32, :require => true
      t.string :title, :limit => 128
      t.string :body, :limit => 4 * 1024
      t.string :video, :limit => 1024
      t.timestamps
    end

    add_index :sections, :name
  end

  def self.down
    drop_table :sections
  end
end
