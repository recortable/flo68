class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.string :planos_generator, :limit => 32
      t.string :ensayos_generator, :limit => 32
      t.string :elpalo_generator, :limit => 32
      t.string :planos_url, :limit => 1000
      t.string :ensayos_url, :limit => 1000
      t.string :elpalo_url, :limit => 1000
      t.timestamps
    end

    Tutorial.create!
  end

  def self.down
    drop_table :tutorials
  end
end
