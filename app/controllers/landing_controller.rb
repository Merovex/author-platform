class LandingController < ApplicationController
  def index
    @book = Book.featured.last || Book.last
    if @book.nil?
      # @posts = Post.all
      # render "posts/index"
      render :index
    else
      render "books/show"
    end
  end
end