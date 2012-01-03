class MetersController < ApplicationController
  def index
    if params[:search].present?
        @meters = Meter.near(params[:search], 0.4, :order => :distance, :units => :km)
        @json = Meter.near(params[:search], 0.4, :order => :distance, :units => :km).to_gmaps4rails
      else
    @meters = Meter.all
    @json = Meter.all.to_gmaps4rails
  end
  end

  def show
    @meter = Meter.find(params[:id])
    @json = Meter.near(@meter, 0.3, :order => :distance, :units => :km).to_gmaps4rails
  end

  def new
    @meter = Meter.new
  end

  def create
    @meter = Meter.new(params[:meter])
    if @meter.save
      redirect_to @meter, :notice => "Successfully created meter."
    else
      render :action => 'new'
    end
  end

  def edit
    @meter = Meter.find(params[:id])
  end

  def update
    @meter = Meter.find(params[:id])
    if @meter.update_attributes(params[:meter])
      flash[:success] = "Successfully updated meter."
      redirect_to @meter
    else
      render :action => 'edit'
    end
  end

  def destroy
    @meter = Meter.find(params[:id])
    @meter.destroy
    flash[:warning] = "Successfully destroyed meter."
    redirect_to meters_url
  end
end
