class FavaritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favarite = current_user.favarites.build(micropost: @micropost)
    
    if @favarite.save
      flash[:success] = 'お気に入りに追加しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'お気に入りの追加に失敗しました。'
      render 'toppages/index'
    end
    
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unfavarite(@micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
