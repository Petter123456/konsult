class KonsultersController < ApplicationController
  before_action :set_konsulter, only: [:show, :edit, :update, :destroy]

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
      params.require(:konsulter).permit(:name, :start_date, :end_date, :competence)
    end
end
