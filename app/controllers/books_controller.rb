class BooksController < ApplicationController
  before_action :get_series, only: %i[ new edit ]
  before_action :set_book, only: %i[ show edit update destroy release]
  after_action :get_cover_bgcolor, only: %i[ create update ]
  after_action :track_action, only: %i[show]
  load_and_authorize_resource

  # GET /books or /books.json
  def index
    @published = Book.published
    @unpublished = Book.unpublished
  end
  def release
    @book.released_on = DateTime.now
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully published." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @episode = Episode.new
  end

  # GET /books/1/edit
  def edit
    @episode = @book.episode || Episode.new
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        @episode = @book.episode || Episode.new
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find_using_slug(params[:id])
      redirect_to '/book#index', error: "Book not found" if @book.nil?
    end
    def get_series
      @series = Series.all
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :is_featured, :released_on, :status, :synopsis, :tagline, :excerpt, :cover, :hero_background, episode_attributes: [:order, :series_id])
    end
    def get_cover_bgcolor
      return unless @book.cover.attached?
      color = "888888"
      color = `convert #{rails_blob_url(@book.cover)} -resize 1x1 txt:-`.match(/#[A-Fa-f0-9]{3,6}/)
      unless color == @book.cover_color
        @book.cover_color = color
        @book.save!
      end
    end
    def track_action
      ahoy.track "View Book", object: 'book', id: @book.id
    end
end
