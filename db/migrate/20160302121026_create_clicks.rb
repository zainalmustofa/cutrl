class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :url, index: true, foreign_key: true
      t.text :referer, default: nil
      t.integer :count, default: 0 
      t.string :browser, default: nil
      t.boolean :is_mobile, default: nil
      t.string :country, default: nil

      t.timestamps null: false
    end
  end
end
