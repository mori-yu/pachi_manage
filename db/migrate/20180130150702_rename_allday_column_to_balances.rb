class RenameAlldayColumnToBalances < ActiveRecord::Migration[5.1]
  def change
    rename_column :balances, :allday, :allDay
  end
end
