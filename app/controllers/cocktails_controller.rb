class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[ show edit update destroy ]

  # GET /cocktails or /cocktails.json
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1 or /cocktails/1.json
  def show
    @doses = Dose.where(cocktail_id: params[:id])
    # raise
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails or /cocktails.json
  def create
    @cocktail = Cocktail.new(cocktail_params)

    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: "Cocktail was successfully created." }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :photo)
    end
end
