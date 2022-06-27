class StaticController < ApplicationController
  def privacy
    @title = "Privacy Policy"
    flash.alert = "Updated: 9 January 2022."
  end
  def terms
    @title = "Terms of Use"
    flash.alert = "Updated: 30 November 2021"
  end
  def diceware
    @title = "Diceware"
  end
end
