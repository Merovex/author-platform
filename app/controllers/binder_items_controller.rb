class BinderItemsController < ApplicationController
  before_action :set_binder_item, only: %i[ show edit update destroy ]
  before_action :set_binder, only: %i[new create]
  layout 'binder'

  # GET /binder_items or /binder_items.json
  def index
    @binder_items = BinderItem.all
  end

  # GET /binder_items/1 or /binder_items/1.json
  def show
  end

  # GET /binder_items/new
  def new
    @binder_item = @binder.binder_items.build
  end

  # GET /binder_items/1/edit
  def edit
  end

  # POST /binder_items or /binder_items.json
  def create
    @binder_item = @binder.binder_items.build(binder_item_params)

    respond_to do |format|
      if @binder_item.save
        format.turbo_stream #{ render turbo_stream: turbo_stream.replace('binder_items', partial: 'binder_items/binder_item', locals: { binder_item: @binder_item }) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @binder_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /binder_items/1 or /binder_items/1.json
  def update
    respond_to do |format|
      if @binder_item.update(binder_item_params)
        format.turbo_stream 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @binder_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /binder_items/1 or /binder_items/1.json
  def destroy
    @binder_item.destroy

    respond_to do |format|
      format.html { redirect_to binder_items_url, notice: "Binder item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binder
      @binder = Binder.find(params[:binder_id])
    end
    def set_binder_item
      @binder_item = BinderItem.find(params[:id])
      @binder = @binder_item.binder
    end

    # Only allow a list of trusted parameters through.
    def binder_item_params
      params.require(:binder_item).permit(:name, :ancestry, :synopsis, :binder_id, :content)
    end
end
