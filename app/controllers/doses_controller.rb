class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = dose.cocktail
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
