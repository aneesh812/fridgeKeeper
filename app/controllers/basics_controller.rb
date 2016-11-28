require 'car_decorator'
class BasicsController < ApplicationController
  before_action :set_basic, only: [:show, :edit, :update, :destroy]

  # GET /basics
  # GET /basics.json
  def index
    @basics = Basic.all
  end

  # GET /basics/1
  # GET /basics/1.json
  def show
  end

  # GET /basics/new
  def new
    @basic = Basic.new
  end

  # GET /basics/1/edit
  def edit
  end

  # POST /basics
  # POST /basics.json
  def create
    @basic = Basic.new()
@basic.firstname = params[:basic][:firstname]
@basic.lastname = params[:basic][:lastname]
@basic.color = params[:basic][:color]
@basic.manufacturer = params[:basic][:manufacturer]
# create an instance/object of a BasicCar
myCar = BasicCar.new(15000, @basic.manufacturer, @basic.color)
# add the extra features to the new basic
if params[:basic][:windows].to_s.length > 0 then
myCar = ElectricWindowsDecorator.new(myCar)
end
if params[:basic][:mirror].to_s.length > 0 then
myCar = MirrorDecorator.new(myCar)
end
if params[:basic][:psensor].to_s.length > 0 then
myCar = ParkingSensorDecorator.new(myCar)
end
## populate the cost and the description details
@basic.cost = myCar.cost
@basic.description = myCar.details
respond_to do |format|
if @basic.save
format.html { redirect_to @basic, notice: 'basic was successfully created.'}
format.json { render :show, status: :created, location: @basic }
else
format.html { render :new }
format.json { render json: @basic.errors, status: :unprocessable_entity }
end
end
end

  # PATCH/PUT /basics/1
  # PATCH/PUT /basics/1.json
  def update
    respond_to do |format|
      if @basic.update(basic_params)
        format.html { redirect_to @basic, notice: 'Basic was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic }
      else
        format.html { render :edit }
        format.json { render json: @basic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basics/1
  # DELETE /basics/1.json
  def destroy
    @basic.destroy
    respond_to do |format|
      format.html { redirect_to basics_url, notice: 'Basic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic
      @basic = Basic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_params
      params.require(:basic).permit(:firstname, :lastname, :manufacturer, :cost, :description, :color)
    end
end
