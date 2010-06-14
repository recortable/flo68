class BiggerComments < ActiveRecord::Migration
  def self.up
    change_column :comments, :body, :string, :limit => 1024
    Comment.all.each do |c|
      c.body.strip! if c.body
      c.save
    end
  end

  def self.down
  end
end
