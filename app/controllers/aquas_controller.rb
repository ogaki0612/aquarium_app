class AquasController < ApplicationController
  def index
    @aquas = Aqua.includes(:user).all
  end

  def new
    @aqua = Aqua.new
  end

  def create
    @aqua = Aqua.new(aqua_params)
    if @aqua.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @aqua = Aqua.find(params[:id])
    @comment = Comment.new
    @comments = @aqua.comments.includes(:user)
  end

  def edit
    @aqua = Aqua.find(params[:id])
    unless current_user.id == @aqua.user_id
      redirect_to action: :index
    end
  end

  def update
    @aqua = Aqua.find(params[:id])
    if @aqua.update(aqua_params)
      redirect_to aqua_path(@aqua.id)
    else
      render :edit
    end
  end

  def destroy
    @aqua = Aqua.find(params[:id])
    @aqua.destroy
    redirect_to root_path
  end
  
  private

  def aqua_params
    params.require(:aqua).permit(:title, :details, :category_id, :image).merge(user_id: current_user.id)
  end
end
