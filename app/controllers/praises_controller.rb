class PraisesController < ApplicationController
  before_action :set_book
  before_action :set_praise, only: %i[ show edit update destroy ]

  # GET /praises or /praises.json
  def index
    @praises = @book.praises.all
  end

  # GET /praises/1 or /praises/1.json
  def show
  end

  # GET /praises/new
  def new
    @praise = @book.praises.build
  end

  # GET /praises/1/edit
  def edit
  end

  # POST /praises or /praises.json
  def create
    @praise = @book.praises.new(praise_params)

    respond_to do |format|
      if @praise.save
        format.html { redirect_to @book, notice: "Praise was successfully created." }
        format.json { render :show, status: :created, location: @praise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @praise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /praises/1 or /praises/1.json
  def update
    respond_to do |format|
      if @praise.update(praise_params)
        format.html { redirect_to @book, notice: "Praise was successfully updated." }
        format.json { render :show, status: :ok, location: @praise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @praise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /praises/1 or /praises/1.json
  def destroy
    @praise.destroy
    respond_to do |format|
      format.html { redirect_to praises_url, notice: "Praise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find_using_slug(params[:book_id])
    end
    def set_praise
      @praise = @book.praises.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def praise_params
      params.require(:praise).permit(:comment)
    end
end
