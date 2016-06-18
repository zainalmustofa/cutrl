class AddColumnToUrlValidUrl < ActiveRecord::Migration
  def change
    add_column :urls, :valid_url, :boolean, default: false
  end
end
