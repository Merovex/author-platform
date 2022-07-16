class CastMembersController < ApplicationController
  before_action :set_cast_member, only: %i[ show edit update destroy ]
  load_and_authorize_resource
  before_action :authenticate_user!

  # GET /cast_members or /cast_members.json
  def index
    @cast_members = CastMember.all
  end

  # GET /cast_members/1 or /cast_members/1.json
  def show
  end

  # GET /cast_members/new
  def new
    @cast_member = CastMember.new
  end

  # GET /cast_members/1/edit
  def edit
  end

  # POST /cast_members or /cast_members.json
  def create
    @cast_member = CastMember.new(cast_member_params)

    respond_to do |format|
      if @cast_member.save
        format.html { redirect_to cast_member_url(@cast_member), notice: "Cast member was successfully created." }
        format.json { render :show, status: :created, location: @cast_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cast_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cast_members/1 or /cast_members/1.json
  def update
    respond_to do |format|
      if @cast_member.update(cast_member_params)
        format.html { redirect_to cast_member_url(@cast_member), notice: "Cast member was successfully updated." }
        format.json { render :show, status: :ok, location: @cast_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cast_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cast_members/1 or /cast_members/1.json
  def destroy
    @cast_member.destroy

    respond_to do |format|
      format.html { redirect_to cast_members_url, notice: "Cast member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast_member
      @cast_member = CastMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cast_member_params
      params.require(:cast_member).permit(:book_id, :character_id, :summary)
    end
end
