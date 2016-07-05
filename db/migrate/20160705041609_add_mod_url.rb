class AddModUrl < ActiveRecord::Migration
  def change
    add_column :urls, :mod_url, :string, default: nil
  end
end
