class BookLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  before_action :set_link, only: %i[show edit update destroy]

  def index; end

  def show
    @series = @book.series
  end

  def new
    @link = @book.links.build(url: 'http://example.com')
    # @link.tag_list.add('amazon')
  end

  def create
    @link = @book.links.build(url: link_params['url'], css: link_params[:type])
    @link.slug = [@book.title, link_params[:type]].join('').downcase

    respond_to do |format|
      if @link.save
        @link.tag_list = params[:tag_list] unless params[:taglist].nil? || params[:tag_list].blank?
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('cta-links', partial: 'components/cta_link',
                                                                locals: { cta_link: @link })
        end
        format.html { redirect_to :index, notice: 'Link was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @book.update(link_params)
        @link.tag_list = params[:tag_list] unless params[:taglist].nil? || params[:tag_list].blank?
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(dom_id(@link), partial: 'components/cta_link',
                                                                  locals: { cta_link: @link })
        end
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :comment, :type, :slug)
  end

  def set_book
    @book = Book.find_using_slug(params[:book_id])
    redirect_to '/book#index', error: 'Book not found' if @book.nil?
  end

  def set_link
    @link = @book.links.find_using_slug(params[:id])
  end
end
