class LogsController < ApplicationController

  def create
    @log = Log.new(log_params)
    if @log.save
      redirect_to aqua_path(@log.aqua)
    else
      @aqua = @log.aqua
      @log = Log.new
      @logs = @aqua.logs
      @comment = Comment.new
      @comments = @aqua.comments.includes(:user)
      render "aquas/show"
    end
  end

  def show
    @log = Log.find(params[:id])
    @aqua = @log.aqua
  end

  private

  def log_params
    params.require(:log).permit(:title, :image).merge(aqua_id: params[:aqua_id])
  end
  
end
