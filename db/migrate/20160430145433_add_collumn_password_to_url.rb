class AddCollumnPasswordToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :password_digest, :string, default: nil
    add_column :urls, :ip, :integer, default: nil
    add_column :urls, :region, :string, default: nil
    add_column :urls, :loc, :string, default: nil
  end
end
