class PostsController < ApplicationController
  
  before_action :set_post, only: %i[ show edit update destroy publish broadcast ]
  before_action :authenticate_user!, except: %i[show index]
  load_and_authorize_resource

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    
  end
  def publish
    @post.publish_now
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully published." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def broadcast
    respond_to do |format|
      if @post.broadcasted_at.nil?
        subscribers = Subscription.users(:posts)
        subscribers.each do |subscriber|
          SubscriptionMailer.post_email(subscriber,@post).deliver
        end
        @post.broadcasted_at = Time.now.utc
        @post.save
        format.html { redirect_to @post, notice: "Post was successfully broadcast to #{subscribers.count} subscribers." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_using_slug(params[:id])
      redirect_to '/posts#index', error: "Post not found" if @post.nil?
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :published_at)
    end
end
