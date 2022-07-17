class BooksController < ApplicationController
  add_breadcrumb 'Dashboard', :dashboard_path, only: %i[new edit]
  add_breadcrumb 'Books', :books_path
  before_action :get_series, only: %i[new create]
  before_action :set_book, only: %i[show edit update destroy release move]
  after_action :get_cover_bgcolor, only: %i[create update]
  after_action :track_action, only: %i[show]
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[show index]
  layout 'insiders', only: %i[new edit admin]
  

  # GET /books or /books.json
  def index
    @published = {}
    Book.published.sort_by(&:position).map do |book|
      @published[book.series] = [] if @published[book.series].nil?
      @published[book.series] << book
    end
  end

  def admin
    authorize! :admin, Book
    @series = Series.all
  end

  def release
    authorize! :admin, @book
    @book.released_on = Time.now

    respond_to do |format|
      if @book.save
        PublishBookNotification.with(book: Book.first).deliver(User.first)
        format.html { redirect_to @book, notice: 'Book was successfully published.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /books/1 or /books/1.json
  def show
    @series = @book.series
  end

  # GET /books/new
  def new
    authorize! :admin, Book
    @book = Book.new
    @serials = Series.all
  end

  # GET /books/1/edit
  def edit
    authorize! :admin, @book
    add_breadcrumb @book.to_s.titleize, book_path(@book)
    @series = Series.all
  end

  # POST /books or /books.json
  def create
    authorize! :admin, Book
    @book = @serial.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    authorize! :admin, @book
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def move
    authorize! :admin, @book
    @series = @book.series
    puts "HERE"
    puts @book.insert_at(book_params[:position].to_i)
    puts @book.inspect
    head :ok
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    authorize! :admin, @book
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
    add_breadcrumb @book.to_s.titleize, book_path(@book) unless @book.nil?
    redirect_to not_found_path, error: 'Book not found' unless @book.present?
  end

  def get_series
    @serial = Series.find(params[:series_id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:position, :title, :is_featured, :released_on, :status, :synopsis, :tagline,
                                 :excerpt, :cover, :hero_background, series_attributes: [:id])
  end

  def get_cover_bgcolor
    return unless @book.cover.attached?

    color = `convert #{rails_blob_url(@book.cover)} -resize 1x1 txt:-`.match(/#[A-Fa-f0-9]{3,6}/)
    unless color == @book.cover_color
      @book.cover_color = color
      @book.save!
    end
  end

  def track_action
    ahoy.track 'View Book', object: 'book', id: @book.id
  end
end
