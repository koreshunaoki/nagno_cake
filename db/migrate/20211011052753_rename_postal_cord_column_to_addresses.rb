class RenamePostalCordColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :postal_cord, :postal_code
  end
end
