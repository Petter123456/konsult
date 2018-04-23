class KonsultersController < ApplicationController
  before_action :set_konsulter, only: [:show, :edit, :update, :destroy]

  attr_reader :konsulter_params

  def search
  # @artist = Artist.where(name: params[:term]) #run through the database and find me the artist with the right name
    #
    # @artist = Artist.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    #
    # @album = Album.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    # @record_labels = RecordLabel.where("name LIKE ?", params[:term])  #run through the database and find me the artist with the right name no matter if its lower case
    #
    # @result = @album + @artist + @record_labels

    # puts customer_params
#

    # @konsulter_end_date = params[(:end_date)].to_i
    # @customer_start_date = params[(:startdate)].to_i
    #
    # if @konsulter_end_date <= @customer_start_date rescue Date.now
      #ALL THE ABOVE REFACTORED
    if params[:startdate].to_s <= params[:end_date].to_s then
      flash.now[:alert] = 'Error while sending message!'
    elsif if params[:startdate].to_s >= params[:end_date].to_s then
      @result = []
      [Konsulter].each do |model|
        @result += model.where("competence LIKE ?", "%#{params[:term]}%")#starts with or ends with my term
      end
    end
  end
    # elsif nil
    #   puts "inga konsulter lediga"
    # end
  end

  # GET /konsulters
  # GET /konsulters.json
  def index
    @konsulters = Konsulter.all
  end

  # GET /konsulters/1
  # GET /konsulters/1.json
  def show
  end

  # GET /konsulters/new
  def new
    @konsulter = Konsulter.new
  end

  # GET /konsulters/1/edit
  def edit
  end

  # POST /konsulters
  # POST /konsulters.json
  def create
    @current_us = current_user
    @konsulter = @current_us.konsulter.new(konsulter_params)

    respond_to do |format|
      if @konsulter.save
        format.html { redirect_to @konsulter, notice: 'Konsulter was successfully created.' }
        format.json { render :show, status: :created, location: @konsulter }
      else
        format.html { render :new }
        format.json { render json: @konsulter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /konsulters/1
  # PATCH/PUT /konsulters/1.json
  def update
    respond_to do |format|
      if @konsulter.update(konsulter_params)
        format.html { redirect_to @konsulter, notice: 'Konsulter was successfully updated.' }
        format.json { render :show, status: :ok, location: @konsulter }
      else
        format.html { render :edit }
        format.json { render json: @konsulter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /konsulters/1
  # DELETE /konsulters/1.json
  def destroy
    @konsulter.destroy
    respond_to do |format|
      format.html { redirect_to konsulters_url, notice: 'Konsulter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_konsulter
      @konsulter = Konsulter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def konsulter_params
      params.require(:konsulter).permit(:name, :start_date, :end_date, :competence, :startdate, :experience)
    end
end
