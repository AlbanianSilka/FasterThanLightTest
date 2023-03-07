module ExpensesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == set_column && set_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
end
