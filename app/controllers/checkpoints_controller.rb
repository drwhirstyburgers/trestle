class CheckpointsController < ApplicationController
  before_action :set_checkpoint, only: [:show, :edit, :update, :destroy]

  # GET /checkpoints
  # GET /checkpoints.json
  def index
    @checkpoints = Checkpoint.all
  end

  # GET /checkpoints/1
  # GET /checkpoints/1.json
  def show
  end

  # GET /checkpoints/new
  def new
    @checkpoint = Checkpoint.new
    @sections = Section.all
  end

  # GET /checkpoints/1/edit
  def edit
    @sections = Section.all
  end

  # POST /checkpoints
  # POST /checkpoints.json
  def create
    @checkpoint = Checkpoint.new(checkpoint_params)
    @section = Section.find(checkpoint_params[:section_id])
    @course = @section.course

    respond_to do |format|
      if @checkpoint.save
        format.html { redirect_to @course, notice: 'Checkpoint was successfully created.' }
        format.json { render :show, status: :created, location: @checkpoint }
      else
        format.html { render :new }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoints/1
  # PATCH/PUT /checkpoints/1.json
  def update
    respond_to do |format|
      if @checkpoint.update(checkpoint_params)
        format.html { redirect_to @checkpoint, notice: 'Checkpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkpoint }
      else
        format.html { render :edit }
        format.json { render json: @checkpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoints/1
  # DELETE /checkpoints/1.json
  def destroy
    @checkpoint.destroy
    respond_to do |format|
      format.html { redirect_to checkpoints_url, notice: 'Checkpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_section_checkpoints
    checkpoints = Checkpoint.where(section_id: params[:id])

    if checkpoints.present?
      render json: checkpoints.to_json, status: :ok
    else
      render json: "Unable to find checkpoints".to_json, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint
      @checkpoint = Checkpoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_params
      params.require(:checkpoint).permit(:title, :section_id, :description, :time_to_complete, :content)
    end
end
