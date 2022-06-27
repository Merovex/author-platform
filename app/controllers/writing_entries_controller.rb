class WritingEntriesController < ApplicationController
  before_action :ensure_frame_response, only: %i[new edit]
  before_action :set_bucket
  before_action :set_writing_entry, only: %i[show edit update destroy]

  # GET /writing_entries or /writing_entries.json
  def index
    @writing_entries = WritingEntry.all
  end

  # GET /writing_entries/1 or /writing_entries/1.json
  def show; end

  # GET /writing_entries/new
  def new
    date = DateTime.parse(params[:date])
    @writing_entry = @bucket.writing_entries.build(wrote_on: date, count: 0)
  end

  # GET /writing_entries/1/edit
  def edit; end

  # POST /writing_entries or /writing_entries.json
  def create
    @writing_entry = @bucket.writing_entries.build(writing_entry_params)

    respond_to do |format|
      if @writing_entry.save
        @date = @writing_entry.wrote_on
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@date, partial: 'writing_entries/writing_entry',
                                                           locals: { entry: @writing_entry })
        end
        format.html { redirect_to bucket_url(@bucket), notice: 'Writing entry was successfully created.' }
        format.json { render :show, status: :created, location: @writing_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @writing_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writing_entries/1 or /writing_entries/1.json
  def update
    respond_to do |format|
      if @writing_entry.update(writing_entry_params)
        @date = @writing_entry.wrote_on
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@date, partial: 'writing_entries/writing_entry',
                                                           locals: { entry: @writing_entry })
        end
        format.html { redirect_to bucket_url(@bucket), notice: 'Writing entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @writing_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @writing_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writing_entries/1 or /writing_entries/1.json
  def destroy
    @writing_entry.destroy

    respond_to do |format|
      format.html { redirect_to writing_entries_url, notice: 'Writing entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bucket
    # http://localhost:3000/buckets/In6BrC9/writing_entries/1/edit
    @bucket = Bucket.find_using_slug(params[:bucket_id])
    @target = @bucket.target
    @total = 0
  end

  def set_writing_entry
    @writing_entry = @bucket.writing_entries.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def writing_entry_params
    params.require(:writing_entry).permit(:wrote_on, :count, :comment)
  end
end
