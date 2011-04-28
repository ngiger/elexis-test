class ProductModulesController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  def index
    @product_modules = ProductModule.paginate(:page => params[:page])
  end

  def show
    @product_module = ProductModule.find(params[:id])
  end

  def new
    @product_module = ProductModule.new
  end

  def create
    @product_module = ProductModule.new(params[:product_module])
    if @product_module.save
      redirect_to @product_module, :notice => "Successfully created product module."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_module = ProductModule.find(params[:id])
  end

  def update
    @product_module = ProductModule.find(params[:id])
    if @product_module.update_attributes(params[:product_module])
      redirect_to @product_module, :notice  => "Successfully updated product module."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_module = ProductModule.find(params[:id])
    @product_module.destroy
    redirect_to product_modules_url, :notice => "Successfully destroyed product module."
  end
end
