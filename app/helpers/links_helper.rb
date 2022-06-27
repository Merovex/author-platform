module LinksHelper
  def get_button_color(k)
    colors = {
      kindle: 'green',
      amazon: 'orange',
      audible: 'blue'
    }
    colors[k.to_sym] || 'blue'
  end

  def get_cta_label(link)
    if !link.css.blank?
      link.css
    elsif !link.tag_list.first.blank?
      link.tag_list.first
    else
      'buy-book'
    end
  end
end
