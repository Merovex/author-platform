class TodosController < ApplicationController
  before_action :set_todolist, only: %i[ new create ] #%i[ show edit update destroy ]
  before_action :set_todo, only: %i[ show edit update destroy toolbar ]
  before_action :authenticate_user!#, except: %i[show index]
  load_and_authorize_resource

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end
  # todo_details
  def toolbar
    respond_to do |format|
      format.html { raise "HTML Not implemented" }
      format.turbo_stream { render turbo_stream: turbo_stream.replace('toolbar', partial: "todos/toolbar", locals: {todo: @todo}) }
      format.json { raise "Not implemented"}
    end
  end

  # POST /todos or /todos.json
  def create
    @todo = @todolist.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        # format.turbo_stream { render turbo_stream: turbo_stream.append('todos-in-progress', partial: "todos/todo", locals: {todo: @todo}) }
        # format.html { redirect_to todolist_url(@todo.todolist_id), notice: "Todo was successfully created." }
        # format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('todo_details', partial: "todos/todo_details") }
        format.html { redirect_to todolist_url(@todo.todolist_id), notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
  def complete 
    @todo.done_at = DateTime.now
    @todolist = @todo.todolist
    respond_to do |format|
      if @todo.save
        format.turbo_stream
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todolist_url(@todo.todolist_id), notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end
    def set_todolist
      @todolist = Todolist.find(params[:todolist_id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:created_by_id, :assigned_to_id, :due_on, :summary)
    end
end
