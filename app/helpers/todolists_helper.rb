module TodolistsHelper
  def todolist_title_with_project(todolist)
    return '' if todolist.todolistable.nil?

    label = " for #{link_to(todolist.todolistable, todolist.todolistable, class: 'link')}".html_safe
  end

  # todolist_heading(todolist, @show_project, @show_heading)
  def todolist_heading(todolist, show_project, show_heading)
    label = link_to(sanitize(todolist.name), todolist, class: 'link')
    label += todolist_title_with_project(todolist) if show_project
    return headline(label) if show_heading

    h3(label, class: 'font-semibold text-xl')
  end

  def todo_ratio(todolist)
    done_todos = todolist.todos.map { |t| t.done_at }.reject(&:nil?).count
    total_todos = todolist.todos.count
    ratio = "#{done_todos}/#{total_todos} completed"
    if total_todos == done_todos
      ratio << ' - '
      ratio << link_to('Archive List', todolist_path(todolist), class: 'underline',
                                                                data: {
                                                                  turbo_method: :delete,
                                                                  turbo_confirm: 'Are you sure?'
                                                                })
      tag.span(ratio.html_safe, id: "ratio_#{todolist.id}")
    else
      tag.span(ratio, id: "ratio_#{todolist.id}")
    end
  end
end
