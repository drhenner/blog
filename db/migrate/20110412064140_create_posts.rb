class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string    :title
      t.text      :content
      t.text      :markdown
      t.datetime  :posted_at
      t.integer   :user_id
      t.string    :state, :length => 64

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
