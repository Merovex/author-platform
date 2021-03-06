class CommentsController < ApplicationController
  before_action :set_parent, except: %i[destroy]
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1 or /comments/1.json
  # def show; end

  # GET /comments/new
  def new
    @comment = @parent.comments.build
    @comment.user = current_user
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.turbo_stream if @comment.save
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@comment, partial: 'comments/comment',
                                                              locals: { comment: @comment })
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent = Todolist.find(params[:todolist_id]) unless params[:todolist_id].nil?
    @parent = Todo.find(params[:todo_id]) unless params[:todo_id].nil?
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(%i[content commentable_id commentable_type])
  end
end
