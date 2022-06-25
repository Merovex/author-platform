module TodosHelper
  def todo_checkbox(todo)
    if todo.done_at.nil?
      # data: { turbo_method: :get, turbo_confirm: "Are you sure you want to broadcast?"}
      return button_to(
              bi_icon('square'),
              complete_todo_path(todo),
              method: :put
              # data: { turbo_method: :get, turbo_confirm: "Are you sure you want to broadcast?" }
            )
    else
      return bi_icon('check-square-fill', class: 'fill-brand')
    end
  end
end
