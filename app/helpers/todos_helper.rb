module TodosHelper
  def todo_checkbox(todo)
    if todo.done_at.nil?
      button_to(
        bi_icon('square'),
        complete_todo_path(todo),
        method: :put
      )
    else
      bi_icon('check-square-fill', class: 'fill-brand')
    end
  end
  def todo_css(todo)
    (todo.done_at.nil?) ? "" : " completed"
  end
end
