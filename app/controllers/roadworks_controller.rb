class RoadworksController < ApplicationController
  before_action :set_roadwork, only: [:show, :edit, :update, :destroy]

  # GET /roadworks
  # GET /roadworks.json
  def index
    @roadworks = Roadwork.all
  end

  # GET /roadworks/1
  # GET /roadworks/1.json
  def show
  end

  # GET /roadworks/new
  def new
    @roadwork = Roadwork.new
  end

  # GET /roadworks/1/edit
  def edit
  end

  # POST /roadworks
  # POST /roadworks.json
  def create
    @roadwork = Roadwork.new(roadwork_params)

    respond_to do |format|
      if @roadwork.save
        format.html { redirect_to @roadwork, notice: 'Roadwork was successfully created.' }
        format.json { render :show, status: :created, location: @roadwork }
      else
        format.html { render :new }
        format.json { render json: @roadwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roadworks/1
  # PATCH/PUT /roadworks/1.json
  def update
    respond_to do |format|
      if @roadwork.update(roadwork_params)
        format.html { redirect_to @roadwork, notice: 'Roadwork was successfully updated.' }
        format.json { render :show, status: :ok, location: @roadwork }
      else
        format.html { render :edit }
        format.json { render json: @roadwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roadworks/1
  # DELETE /roadworks/1.json
  def destroy
    @roadwork.destroy
    respond_to do |format|
      format.html { redirect_to roadworks_url, notice: 'Roadwork was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    @roadworks = Roadwork.search(params[:key])
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roadwork
      @roadwork = Roadwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roadwork_params
      params.require(:roadwork).permit(:description, :startdate, :enddate, :latitude, :longitude, :tags, :submitteddate)
    end
end
