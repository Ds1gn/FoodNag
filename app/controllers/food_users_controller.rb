class FoodUsersController < ApplicationController
  before_action :set_food_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :is_advertiser?

  # GET /food_users
  # GET /food_users.json
  def index
    @food_users = FoodUser.all
  end

  # GET /food_users/1
  # GET /food_users/1.json
  def show
    @notification = FoodUser.find(params[:id])
  end

  #GET /food_users/new
  def new
    @food_user = FoodUser.new
  end

  def edit
    @notification = FoodUser.find(params[:id])
    @food = @notification.food
  end

  # POST /food_users
  # POST /food_users.json
  def create
    @food_user = FoodUser.new(food_user_params)

    respond_to do |format|
      if @food_user.save
        format.html { redirect_to @food_user, notice: 'Food user was successfully created.' }
        format.json { render :show, status: :created, location: @food_user }
      else
        format.html { render :new }
        format.json { render json: @food_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_users/1
  # PATCH/PUT /food_users/1.json
  def update
    respond_to do |format|
      if @food_user.update(food_user_params)
        format.html { redirect_to @food_user, notice: 'Food user was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_user }
      else
        format.html { render :edit }
        format.json { render json: @food_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_users/1
  # DELETE /food_users/1.json
  def destroy
    @food_user.destroy
    respond_to do |format|
      format.html { redirect_to food_users_url, notice: 'Food user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_user
      @food_user = FoodUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_user_params
      params.require(:food_user).permit(:user_id, :food_id, :custom_reminder)
    end
  
end
