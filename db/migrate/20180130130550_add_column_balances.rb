class AddColumnBalances < ActiveRecord::Migration[5.1]
  def change
    add_column :balances, :result, :boolean
  end
end
