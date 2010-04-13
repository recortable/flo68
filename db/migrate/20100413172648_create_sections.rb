class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name, :length => 32, :require => true
      t.string :title, :length => 128
      t.string :body, :length => 4 * 1024
      t.string :video, :length => 1024
      t.timestamps
    end

    add_index :sections, :name
  end

  def self.down
    drop_table :sections
  end
end
