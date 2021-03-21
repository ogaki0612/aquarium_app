class AquasController < ApplicationController
  
  before_action :authenticate_user!,only: [:new, :edit, :create, :update, :destroy]
  before_action :set_aqua, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:update, :destroy, :edit]

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
    @comment = Comment.new
    @comments = @aqua.comments.includes(:user)
  end

  def edit
    unless current_user.id == @aqua.user_id
      redirect_to action: :index
    end
  end

  def update
    if @aqua.update(aqua_params)
      redirect_to aqua_path(@aqua.id)
    else
      render :edit
    end
  end

  def destroy
    @aqua.destroy
    redirect_to root_path
  end
  
  private

  def aqua_params
    params.require(:aqua).permit(:title, :details, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_aqua
    @aqua = Aqua.find(params[:id])
  end

  def ensure_current_user
    redirect_to action: :index if @aqua.user_id != current_user.id
  end
end
