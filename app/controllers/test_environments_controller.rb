class TestEnvironmentsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]

  # GET /product_versions
  # GET /product_versions.xml
   def index
    @test_environments = TestEnvironment.paginate(:page => params[:page])
  end

  def show
    @test_environment = TestEnvironment.find(params[:id])
  end

  def new
    @test_environment = TestEnvironment.new
  end

  def create
    @test_environment = TestEnvironment.new(params[:test_environment])
    if @test_environment.save
      redirect_to @test_environment, :notice => "Successfully created test environment."
    else
      render :action => 'new'
    end
  end

  def edit
    @test_environment = TestEnvironment.find(params[:id])
  end

  def update
    @test_environment = TestEnvironment.find(params[:id])
    if @test_environment.update_attributes(params[:test_environment])
      redirect_to @test_environment, :notice  => "Successfully updated test environment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @test_environment = TestEnvironment.find(params[:id])
    @test_environment.destroy
    redirect_to test_environments_url, :notice => "Successfully destroyed test environment."
  end
end
