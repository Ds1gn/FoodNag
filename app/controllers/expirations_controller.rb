class ExpirationsController < ApplicationController
  before_action :set_expiration, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # before_action :is_advertiser?

  # GET /expirations
  # GET /expirations.json
  def index
    @expirations = current_user.Expiration.all
  end

  # GET /expirations/1
  # GET /expirations/1.json
  def show
  end

  # GET /expirations/new
  def new
    @expiration = Expiration.new
  end

  # GET /expirations/1/edit
  def edit
  end

  # POST /expirations
  # POST /expirations.json
  def create
    @expiration = Expiration.new(expiration_params)

    respond_to do |format|
      if @expiration.save
        format.html { redirect_to @expiration, notice: 'Expiration was successfully created.' }
        format.json { render :show, status: :created, location: @expiration }
      else
        format.html { render :new }
        format.json { render json: @expiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expirations/1
  # PATCH/PUT /expirations/1.json
  def update
    respond_to do |format|
      if @expiration.update(expiration_params)
        format.html { redirect_to @expiration, notice: 'Expiration was successfully updated.' }
        format.json { render :show, status: :ok, location: @expiration }
      else
        format.html { render :edit }
        format.json { render json: @expiration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expirations/1
  # DELETE /expirations/1.json
  def destroy
    @expiration.destroy
    respond_to do |format|
      format.html { redirect_to expirations_url, notice: 'Expiration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expiration
      @expiration = Expiration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expiration_params
      params.require(:expiration).permit(:food_id, :user_id, :expires_at)
    end

    def admin_only
    unless current_user.admin?
      
      redirect_to :back, :alert => "Access denied."

      return false
    end
  end

end
