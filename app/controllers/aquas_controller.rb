class AquasController < ApplicationController
  def index
    @aquas = Aqua.all
  end

  def new
    @aqua = Aqua.new
  end

  def create
    @aqua = Aqua.create(aqua_params)
    if @aqua.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def aqua_params
    params.require(:aqua).permit(:title, :details, :category_id, :image).merge(user_id: current_user.id)
  end
end
