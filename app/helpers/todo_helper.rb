module TodoHelper

  def todo_lists(todos)
    todos.map(&:list_name).uniq
  end

end
