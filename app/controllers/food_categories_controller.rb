class FoodCategoriesController < ApplicationController
  before_action :authenticate_user!
  # before_action :is_advertiser?
  before_action :logged_in_advertiser?
  before_action :set_food_category, only: [:show]
 

  # GET /food_categories
  # GET /food_categories.json
  def index
    @food_categories = FoodCategory.all
    @fruit = @food_categories.find(1)
    @vegetable = @food_categories.find(2)
    @purchases = current_user.purchases.all
    @display
    # @recipe = Recipe.get_recipes
  end

  # GET /food_categories/1
  # GET /food_categories/1.json
  def show
    @foods = @food_category.foods
  end

  # GET /food_categories/new
  def new
    @food_category = FoodCategory.new
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  # GET /food_categories/1/edit
  def edit
  end

  # POST /food_categories
  # POST /food_categories.json
  def create
    # @purchase = Purchase.new(set_purchase)
    @food_category = FoodCategory.new(food_category_params)
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
    respond_to do |format|
      if @food_category.save
        format.json { render :show, status: :created, location: @food_category }
      else
        format.html { render :new }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_categories/1
  # PATCH/PUT /food_categories/1.json
  def update
    respond_to do |format|
      if @food_category.update(food_category_params)
        format.html { redirect_to @food_category, notice: 'Food category was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_category }
      else
        format.html { render :edit }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_categories/1
  # DELETE /food_categories/1.json
  def destroy
    @food_category.destroy
    respond_to do |format|
      format.html { redirect_to food_categories_url, notice: 'Food category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def set_food_category
      @food_category = FoodCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_category_params
      params.require(:food_category).permit(:id, :name, :image)
    end
  
end
