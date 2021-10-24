module LinksHelper
  def get_button_color(k)
    colors = { 
      kindle: 'green',
      amazon: 'orange',
      audible: 'blue'
     }
    return colors[k.to_sym] || 'blue'
  end
end
