class ProtectedStructuresController < ApplicationController
  def index
      if params[:search].present?
        @protected_structures = ProtectedStructure.near(params[:search], 3, :order => :distance, :units => :km)
        @markers = ProtectedStructure.near(params[:search], 3, :order => :distance, :units => :km).to_gmaps4rails
      elsif params[:type] == "arche" 
        @protected_structures = ProtectedStructure.where("protected_structures.rmp_ref IS NOT NULL")
        @markers = ProtectedStructure.where("protected_structures.rmp_ref IS NOT NULL").to_gmaps4rails
      elsif params[:type] == "archi"
        @protected_structures = ProtectedStructure.where("protected_structures.niah_ref IS NOT NULL")
        @markers = ProtectedStructure.where("protected_structures.niah_ref IS NOT NULL").to_gmaps4rails
      elsif params[:type] == "other"
        @protected_structures = ProtectedStructure.where("protected_structures.niah_ref IS NULL and protected_structures.rmp_ref IS NULL", "protected_structures.rmp_ref IS NULL")
        @markers = ProtectedStructure.where("protected_structures.niah_ref IS NULL and protected_structures.rmp_ref IS NULL", "protected_structures.rmp_ref IS NULL").to_gmaps4rails
      else
        @protected_structures = ProtectedStructure.find(:all, :order => "rps_number ASC")
        @markers = ProtectedStructure.all.to_gmaps4rails
      end
    
  end

  def show
    @protected_structure = ProtectedStructure.find(params[:id])
    @json = ProtectedStructure.near(@protected_structure, 3, :order => :distance, :units => :km).to_gmaps4rails
    @center = ProtectedStructure.find(params[:id])
  end

  def new
    @protected_structure = ProtectedStructure.new
  end

  def create
    @protected_structure = ProtectedStructure.new(params[:protected_structure])
    if @protected_structure.save
      redirect_to @protected_structure, :notice => "Successfully created protected structure."
    else
      render :action => 'new'
    end
  end

  def edit
    @protected_structure = ProtectedStructure.find(params[:id])
  end

  def update
    @protected_structure = ProtectedStructure.find(params[:id])
    if @protected_structure.update_attributes(params[:protected_structure])
      redirect_to @protected_structure, :notice  => "Successfully updated protected structure."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @protected_structure = ProtectedStructure.find(params[:id])
    @protected_structure.destroy
    redirect_to protected_structures_url, :notice => "Successfully destroyed protected structure."
  end
end
