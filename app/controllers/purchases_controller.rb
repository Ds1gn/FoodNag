class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # before_action :is_advertiser?
  before_action :logged_in_advertiser?
  before_action :is_advertiser?

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
    @all_purchases = Purchase.with_deleted

  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchases = Purchase.find(params[:id])
  end

  # GET /purchases/new
  def new
    @purchases = Purchase.all 
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = current_user.purchases.new(purchase_params)
    # @display = Recipe.get_recipes(@ingredient)

    respond_to do |format|
      if @purchase.save 
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { 
          @ingredient = @purchase.food.name
          @display = Recipe.get_recipes(@ingredient)
          @display.recipe_with_purchase(@purchase)
          # render :show, status: :created, location: @purchase
          render json: { 
            recipe_title: @display.recipe_title,
            # recipe_image: @display.recipe_image,
            recipe_url: @display.recipe_url,
             purchase_id: @purchase.id }
        }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:purchase_date, :food_id, :user_id)
    end
end
