class LicenseTypesController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
#  before_filter :current_user.admin?,   :only => [:index, :edit, :update, :destroy]
  
  def index
    @license_types = LicenseType.paginate(:page => params[:page])
  end

  def show
    @license_type = LicenseType.find(params[:id])
  end

  def new
    @license_type = LicenseType.new
  end

  def create
    @license_type = LicenseType.new(params[:license_type])
    if @license_type.save
      redirect_to @license_type, :notice => "Successfully created license type."
    else
      render :action => 'new'
    end
  end

  def edit
    @license_type = LicenseType.find(params[:id])
  end

  def update
    @license_type = LicenseType.find(params[:id])
    if @license_type.update_attributes(params[:license_type])
      redirect_to @license_type, :notice  => "Successfully updated license type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @license_type = LicenseType.find(params[:id])
    @license_type.destroy
    redirect_to license_types_url, :notice => "Successfully destroyed license type."
  end
end
