class DonutsController < ApplicationController 
  protect_from_forgery with: :exception
  #     if: Proc.new { |c| c.request.format =~ %r{application/json} }
  protect_from_forgery 
  before_action :set_donut, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user_from_token

  # GET /donuts
  # GET /donuts.json
  def index

    @donut = Donut.find_requested_donuts
    respond_to do |format|
      if format.json
        render json: @donuts
      else
        @donuts
      end
    end
  end

  # GET /donuts/1
  # GET /donuts/1.json
  def show
    respond_to do |format|
      if format.json
        render json: @donut 
      else
        @donut
      end
    end
  end

  # GET /donuts/new
  def new
    @donut = Donut.new
  end

  # GET /donuts/1/edit
  def edit
  end

  # POST /donuts
  # POST /donuts.json
  def create
    @donut = Donut.new(donut_params)

    @donut.user_id = set_current_user_from_token.id
    respond_to do |format|
      if @donut.save
        format.html { redirect_to @donut, notice: 'Donut was successfully created.' }
        format.json {render json: @donut, status: :HTTP_OK}
      else
        format.html { render :new }
        format.json { render json: @donut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donuts/1
  # PATCH/PUT /donuts/1.json
  def update
    respond_to do |format|
      if @donut.update(donut_params)
        format.html { redirect_to @donut, notice: 'Donut was successfully updated.' }
        format.json { render :show, status: :ok, location: @donut }
      else
        format.html { render :edit }
        format.json { render json: @donut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donuts/1
  # DELETE /donuts/1.json
  def destroy
    @donut.destroy
    respond_to do |format|
      format.html { redirect_to donuts_url, notice: 'Donut was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donut
      @donut = Donut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donut_params
      params.require(:donut).permit(:name, :description, :type_of_donut, :shop_id, :review)
    end

    def current_user_params
      params.require(:current_user)
    end

    def set_current_user_from_token
      user_token = request.headers['HTTP_X_USER_TOKEN'].presence
      user       = user_token && User.find_by_authentication_token(user_token.to_s)

      if user != nil
        return user
      else
        redirect_to :root
      end
    end
end
