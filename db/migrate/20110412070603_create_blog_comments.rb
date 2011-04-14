class CreateBlogComments < ActiveRecord::Migration
  def self.up
    create_table :blog_comments do |t|
      t.string :title
      t.string :email
      t.string :website
      t.integer :post_id
      t.text :content
      t.string :permalink
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.boolean :admin
      t.boolean :spam, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :blog_comments
  end
end
