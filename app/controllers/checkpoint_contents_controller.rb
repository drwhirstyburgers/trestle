class CheckpointContentsController < ApplicationController
  before_action :set_checkpoint_content, only: [:show, :edit, :update, :destroy]

  # GET /checkpoint_contents
  # GET /checkpoint_contents.json
  def index
    @checkpoint_contents = CheckpointContent.all
  end

  # GET /checkpoint_contents/1
  # GET /checkpoint_contents/1.json
  def show
  end

  # GET /checkpoint_contents/new
  def new
    @checkpoint_content = CheckpointContent.new
  end

  # GET /checkpoint_contents/1/edit
  def edit
  end

  # POST /checkpoint_contents
  # POST /checkpoint_contents.json
  def create
    @checkpoint_content = CheckpointContent.new(checkpoint_content_params)

    respond_to do |format|
      if @checkpoint_content.save
        format.html { redirect_to @checkpoint_content, notice: 'Checkpoint content was successfully created.' }
        format.json { render :show, status: :created, location: @checkpoint_content }
      else
        format.html { render :new }
        format.json { render json: @checkpoint_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkpoint_contents/1
  # PATCH/PUT /checkpoint_contents/1.json
  def update
    respond_to do |format|
      if @checkpoint_content.update(checkpoint_content_params)
        format.html { redirect_to @checkpoint_content, notice: 'Checkpoint content was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkpoint_content }
      else
        format.html { render :edit }
        format.json { render json: @checkpoint_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkpoint_contents/1
  # DELETE /checkpoint_contents/1.json
  def destroy
    @checkpoint_content.destroy
    respond_to do |format|
      format.html { redirect_to checkpoint_contents_url, notice: 'Checkpoint content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint_content
      @checkpoint_content = CheckpointContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_content_params
      params.require(:checkpoint_content).permit(:type, :text, :video_url, :order, :checkpoint_id)
    end
end
