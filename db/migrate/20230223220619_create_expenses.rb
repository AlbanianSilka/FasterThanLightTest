class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.integer :price
      t.string :name

      t.timestamps
    end
  end
end
