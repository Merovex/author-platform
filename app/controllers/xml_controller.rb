class XmlController < ApplicationController
  def atom
    @feed_title = "FNORD"
    @posts = Post.published.limit(10).sort{|a,b| b.created_at <=> a.created_at }
    @person = User.first
    respond_to do |format|
      format.xml
    end
  end

  def sitemap
      @pages = Page.all
      @books = Book.published
      @posts = Post.published.sort{|a,b| b.created_at <=> a.created_at }
      # raise @posts.inspect
    respond_to do |format|
      format.xml
    end
  end
end
