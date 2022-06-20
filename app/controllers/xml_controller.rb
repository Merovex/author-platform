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
      @last_mod = @posts.sort{|a,b| b.updated_at <=> a.updated_at }.first.updated_at.inspect
      # raise @posts.inspect
    respond_to do |format|
      format.xml
    end
  end
end
