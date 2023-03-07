class AddDescriptionToExpense < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :description, :string
  end
end
