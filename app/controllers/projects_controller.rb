class ProjectsController < ApplicationController
  add_breadcrumb 'Dashboard', :dashboard_path
  before_action :set_project, except: %i[new index create]
  load_and_authorize_resource

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @total = 0
    @percentage = 0
    @target = (@project.target.nil? or @project.target > 0) ? @project.target : 1
    @entries = {}
    @project.writing_entries.each do |entry|
      @entries[entry.wrote_on] = entry
    end
  end

  # GET /projects/new
  def new
    @project = @book.build_project
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html do
          redirect_to project_url(@project), notice: "Writing goal for #{@project.book.title} was successfully created."
        end
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    # raise @project.book.inspect
    respond_to do |format|
      if @project.update(project_params)
        format.html do
          redirect_to project_url(@project),
                      notice: "Writing goal for <em>#{@project.book.title}</em> was successfully updated."
        end
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Writing goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
    @book = @project.book
    add_breadcrumb @book.to_s.titleize, book_path(@book)
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:book_id, :start_on, :finish_on, :target, :summary)
  end
end
