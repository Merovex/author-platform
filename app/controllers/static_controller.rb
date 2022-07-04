class StaticController < ApplicationController
  # caches_page :robots
  def about
    @title = 'About'
  end

  def diceware
    @title = 'Diceware'
  end

  def privacy
    @title = 'Privacy Policy'
    flash.alert = 'Updated: 9 January 2022.'
  end

  def robots
    robots = File.read(Rails.root + 'config/robots.txt')
    render text: robots, layout: false, content_type: 'text/plain'
  end

  def terms
    @title = 'Terms of Use'
    flash.alert = 'Updated: 30 November 2021'
  end
end
