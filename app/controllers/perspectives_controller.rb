class PerspectivesController < ApplicationController
  before_filter :find_perspective

  def index
    @perspectives = Perspective.all
  end
  
  def new
    @perspective = Perspective.new
  end

  def create
    @perspective = Perspective.new(perspective_params)
    if @perspective.save
      redirect_to perspectives_path, notice: 'New perspective successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end  

  private
  def perspective_params
    params.require(:perspective).permit(:title, :description, :sidebar)
  end

  def find_perspective
    @perspective = Perspective.find(params[:id]) if params[:id]
  end
end