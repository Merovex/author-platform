module LinksHelper
  def get_button_color(k)
    colors = { 
      kindle: 'green',
      amazon: 'orange',
      audible: 'blue'
     }
    return colors[k.to_sym] || 'blue'
  end
  def get_cta_label(link)
    if !link.css.blank?
      return link.css
    elsif !link.tag_list.first.blank?
      return link.tag_list.first
    else
      return 'buy-book'
    end
  end
end
