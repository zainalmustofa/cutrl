class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :url, null: false
      t.text :title
      t.string :referer, default: nil
      t.string :slug, null: false
      t.integer :count_click, default: 0 
      t.timestamps null: false
    end
  end
end
