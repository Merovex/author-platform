module StimulusHelper
  def tab_class_link
    return "nav-link block font-medium text-sm leading-tight uppercase border-x-0 border-t-0 border-b-2 border-transparent px-4 py-3 my-2 hover:border-transparent hover:bg-gray-100 focus:border-transparent"
  end
  def tab_tag(label)
    link = link_to(label, "#", class: tab_class_link)
    return tag.li( link, data: { action: "click->tabs#change", tabs_target: 'tab' } )
  end
  def tab_panel(&block)
    content = capture(&block)
    content_tag(:div, content, :class => 'hidden my-6', data: {tabs_target: 'panel'})  
  end
end
