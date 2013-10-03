class LogosController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @logos = Logo.page params[:page]
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

  protected
  def logo_params
    params.require(:logo).permit(:title, :logo)
  end

end
