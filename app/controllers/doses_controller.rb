class DosesController < ApplicationController
  before_action :set_dose, only: %i[ show edit update destroy ]
  
  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end
  
  # POST /doses or /doses.json
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail), notice: "Dose was successfully created."
    else
      render :new
    end
  end
  
  # DELETE /doses/1 or /doses/1.json
  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: "Dose was successfully deleted."
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params["format"])
  end
  
  # Only allow a list of trusted parameters through.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
