class DeployStatesController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]

  # GET /product_versions
  # GET /product_versions.xml
  def index
    @deploy_states = DeployState.paginate(:page => params[:page])
  end

  def show
    @deploy_state = DeployState.find(params[:id])
  end

  def new
    @deploy_state = DeployState.new
  end

  def create
    @deploy_state = DeployState.new(params[:deploy_state])
    if @deploy_state.save
      redirect_to @deploy_state, :notice => "Successfully created deploy state."
    else
      render :action => 'new'
    end
  end

  def edit
    @deploy_state = DeployState.find(params[:id])
  end

  def update
    @deploy_state = DeployState.find(params[:id])
    if @deploy_state.update_attributes(params[:deploy_state])
      redirect_to @deploy_state, :notice  => "Successfully updated deploy state."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @deploy_state = DeployState.find(params[:id])
    @deploy_state.destroy
    redirect_to deploy_states_url, :notice => "Successfully destroyed deploy state."
  end
end
