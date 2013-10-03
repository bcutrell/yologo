class LogosController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index

    if current_user.present? && current_user.admin?
      @logos = Logo.where(state: "submitted")
    else
      @logos = Logo.where(state: "approved")
    end
  
  end

  def new
    @logo = Logo.new
  end

  def show
    @logo = Logo.find(params[:id]) 
  end

  def create
    @logo = Logo.new(logo_params)
    if @logo.save
      redirect_to root_path, notice: "Logo was successfully uploaded"
    else
      render action: 'new'
    end
  end

  def update
    @logo = Logo.find(params[:id])
    @logo.update(params[:state])
    redirect_to :back
  end

  protected
  def logo_params
    params.require(:logo).permit(:title, :logo, :state)
  end

end
