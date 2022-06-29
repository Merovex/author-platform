class PraisesController < ApplicationController
  before_action :set_book
  before_action :set_praise, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /praises or /praises.json
  def index
    @praises = @book.praises.all
  end

  # GET /praises/1 or /praises/1.json
  def show; end

  # GET /praises/new
  def new
    @praise = @book.praises.build
  end

  # GET /praises/1/edit
  def edit; end

  # POST /praises or /praises.json
  def create
    @praise = @book.praises.new(praise_params)

    respond_to do |format|
      if @praise.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append('praises-list', partial: 'praises/praise',
                                                                   locals: { praise: @praise })
        end
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
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@praise, partial: 'praises/praise', locals: { praise: @praise })
        end
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
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_praise
    @praise = @book.praises.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def praise_params
    params.require(:praise).permit(:comment)
  end
end
