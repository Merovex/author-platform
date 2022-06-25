module TodolistsHelper
  def todolist_heading(todolist, show_headline = false)
    return headline(sanitize(todolist.name)) if show_headline
    return h3(link_to(sanitize(todolist.name), todolist_path(todolist)), 'link text-xl font-bold')
  end
  def todo_ratio(todolist)
    done_todos = todolist.todos.map{ |t| t.done_at }.reject(&:nil?).count
    total_todos = todolist.todos.count
     ratio = "#{done_todos}/#{total_todos} completed"
     if (total_todos == done_todos)
      ratio << " - "
      ratio << link_to("Archive List", todolist_path(todolist), class: 'underline',
                  data: {
                    turbo_method: :delete,
                    turbo_confirm: "Are you sure?"
                  })
      return tag.span(ratio.html_safe, id: "ratio_#{todolist.id}")
     else
      return tag.span(ratio, id: "ratio_#{todolist.id}")
     end
     
  end
end
