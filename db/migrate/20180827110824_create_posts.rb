class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :feed, foreign_key: true
      t.string :title
      t.string :url
      t.datetime :publish_date

      t.timestamps
    end
  end
end
