class CreateBalances < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :allday
      t.references :user
      t.timestamps
    end
  end
end
