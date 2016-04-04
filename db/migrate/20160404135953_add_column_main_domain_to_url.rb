class AddColumnMainDomainToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :main_domain, :string, default: nil
  end
end
