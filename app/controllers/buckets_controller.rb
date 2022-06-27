class BucketsController < ApplicationController
  # before_action :set_book, only: %i[ show new edit ]
  before_action :set_bucket # , only: %i[ create update destroy ]

  # GET /buckets or /buckets.json
  def index
    @buckets = Bucket.all
  end

  # GET /buckets/1 or /buckets/1.json
  def show
    @total = 0
    @percentage = 0
    @target = (@bucket.target.nil? or @bucket.target > 0) ? @bucket.target : 1
    @entries = {}
    @bucket.writing_entries.each do |entry|
      @entries[entry.wrote_on] = entry
    end
  end

  # GET /buckets/new
  def new
    @bucket = @book.build_bucket
  end

  # GET /buckets/1/edit
  def edit; end

  # POST /buckets or /buckets.json
  def create
    @bucket = Project.new(bucket_params)

    respond_to do |format|
      if @bucket.save
        format.html { redirect_to bucket_url(@bucket), notice: "Writing goal for #{@bucket.book.title} was successfully created." }
        format.json { render :show, status: :created, location: @bucket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buckets/1 or /buckets/1.json
  def update
    # raise @bucket.book.inspect
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html do
          redirect_to bucket_url(@bucket),
                      notice: "Writing goal for <em>#{@bucket.book.title}</em> was successfully updated."
        end
        format.json { render :show, status: :ok, location: @bucket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckets/1 or /buckets/1.json
  def destroy
    @bucket.destroy

    respond_to do |format|
      format.html { redirect_to buckets_url, notice: 'Writing goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bucket
    @bucket = Bucket.find_using_slug(params[:id])
    @book = @bucket.book
  end

  # Only allow a list of trusted parameters through.
  def bucket_params
    params.require(:bucket).permit(:book_id, :start_on, :finish_on, :target, :summary)
  end
end
