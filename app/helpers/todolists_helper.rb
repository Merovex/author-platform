module TodolistsHelper
  def todolist_heading(todolist, show_headline = false)
    return headline(sanitize(todolist.name)) if show_headline
    return h3(link_to(sanitize(todolist.name), todolist_path(todolist)), 'link text-xl font-bold')
  end
  def todo_ratio(todolist)
     [
      todolist.todos.map{ |t| t.done_at }.reject(&:nil?).count,
      todolist.todos.count
     ].join("/")
  end
end
