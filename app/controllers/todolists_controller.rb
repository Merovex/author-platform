class TodolistsController < ApplicationController
  before_action :set_todolist, only: %i[ show edit update destroy ]
  before_action :authenticate_user!#, except: %i[show index]
  load_and_authorize_resource

  # GET /todolists or /todolists.json
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1 or /todolists/1.json
  def show
    @show_headline = true
    @comments = @todolist.comments
  end

  # GET /todolists/new
  def new
    @todolist = Todolist.new
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists or /todolists.json
  def create
    @todolist = Todolist.new(todolist_params)

    respond_to do |format|
      if @todolist.save
        format.turbo_stream { render turbo_stream: turbo_stream.append('todolists', partial: "todolists/todolist", locals: {todolist: @todolist}) }
        format.html { redirect_to todolist_url(@todolist), notice: "Todolist was successfully created." }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1 or /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@todolist, partial: "todolists/todolist", locals: {todolist: @todolist}) }
        format.html { redirect_to todolist_url(@todolist), notice: "Todolist was successfully updated." }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1 or /todolists/1.json
  def destroy
    @todolist.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todolist_params
      params.require(:todolist).permit(:name, :content)
    end
end
