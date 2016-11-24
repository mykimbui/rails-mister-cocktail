class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:create, :new, :show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @Ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @Ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:Ingredient).permit(:name)
    end

end
