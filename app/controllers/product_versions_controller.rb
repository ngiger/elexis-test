class ProductVersionsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]

  # GET /product_versions
  # GET /product_versions.xml
  def index
    @product_versions = ProductVersion.paginate(:page => params[:page])
    @title = "All product versions"
  end
 
  # GET /product_versions/1
  # GET /product_versions/1.xml
  def show
    @product_version = ProductVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_version }
    end
  end

  # GET /product_versions/new
  # GET /product_versions/new.xml
  def new
    @product_version = ProductVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_version }
    end
  end

  # GET /product_versions/1/edit
  def edit
    @product_version = ProductVersion.find(params[:id])
  end

  # POST /product_versions
  # POST /product_versions.xml
  def create
    @product_version = ProductVersion.new(params[:product_version])

    respond_to do |format|
      if @product_version.save
        format.html { redirect_to(@product_version, :notice => 'Product version was successfully created.') }
        format.xml  { render :xml => @product_version, :status => :created, :location => @product_version }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_versions/1
  # PUT /product_versions/1.xml
  def update
    @product_version = ProductVersion.find(params[:id])
    @product_version.user_id = current_user.id

    respond_to do |format|
      if @product_version.update_attributes(params[:product_version])
        format.html { redirect_to(@product_version, :notice => 'Product version was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_version.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_versions/1
  # DELETE /product_versions/1.xml
  def destroy
    @product_version = ProductVersion.find(params[:id])
    @product_version.destroy

    respond_to do |format|
      format.html { redirect_to(product_versions_url) }
      format.xml  { head :ok }
    end
  end
end
