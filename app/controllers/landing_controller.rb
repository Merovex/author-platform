class LandingController < ApplicationController
  def index
    @book = Book.featured.last || Book.last
    render "books/show"
  end
end