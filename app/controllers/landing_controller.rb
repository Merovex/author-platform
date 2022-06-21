class LandingController < ApplicationController
  def index
    @book = Book.featured.last || Book.last
    if @book.nil?
      @posts = Post.all
      render "posts/index"
    else
      render "books/show"
    end
  end
  def show
    @book = Book.find_using_slug(params[:book_id]) || Book.published.first
  end
end