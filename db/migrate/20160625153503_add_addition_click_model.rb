class AddAdditionClickModel < ActiveRecord::Migration
  def change
    add_column :clicks, :ip, :string, default: nil
    add_column :clicks, :region, :string, default: nil
    add_column :clicks, :city, :string, default: nil
    add_column :clicks, :org, :string, default: nil
    add_column :clicks, :loc, :string, default: nil
  end
end
