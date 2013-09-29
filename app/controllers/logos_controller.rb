class LogosController < ApplicationController
  before_action :authenticate_user!

  def index
    @logos = Logo.all
  end

  def new
    @logo = Logo.new
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
