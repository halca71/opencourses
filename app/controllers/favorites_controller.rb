class FavoritesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    current_user.favorite(course)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    course = Course.find(params[:course_id])
    current_user.unfavorite(course)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
