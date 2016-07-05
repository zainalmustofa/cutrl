class CreateContactforms < ActiveRecord::Migration
  def change
    create_table :contactforms do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :type, null: false, default: ""
      t.text   :message, null: false, default: ""
      t.timestamps null: false
    end
  end
end