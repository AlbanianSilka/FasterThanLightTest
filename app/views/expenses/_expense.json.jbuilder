json.extract! expense, :id, :type, :price, :name, :created_at, :updated_at
json.url expense_url(expense, format: :json)
