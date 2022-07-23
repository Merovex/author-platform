class BindersController < ApplicationController
  before_action :set_binder, only: %i[ show edit update destroy ]

  # GET /binders or /binders.json
  def index
    @binders = Binder.all
  end

  # GET /binders/1 or /binders/1.json
  def show
  end

  # GET /binders/new
  def new
    @binder = Binder.new
  end

  # GET /binders/1/edit
  def edit
  end

  # POST /binders or /binders.json
  def create
    @binder = Binder.new(binder_params)

    respond_to do |format|
      if @binder.save
        format.html { redirect_to binder_url(@binder), notice: "Binder was successfully created." }
        format.json { render :show, status: :created, location: @binder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /binders/1 or /binders/1.json
  def update
    respond_to do |format|
      if @binder.update(binder_params)
        format.html { redirect_to binder_url(@binder), notice: "Binder was successfully updated." }
        format.json { render :show, status: :ok, location: @binder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @binder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /binders/1 or /binders/1.json
  def destroy
    @binder.destroy

    respond_to do |format|
      format.html { redirect_to binders_url, notice: "Binder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binder
      @binder = Binder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def binder_params
      params.require(:binder).permit(:project_id, :type)
    end
end
