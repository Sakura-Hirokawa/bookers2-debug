class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  # フォロー機能を作成・保存・削除する
  def create
    current_user.follow(@user)
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to request.referer
  end

  # フォロー・フォロワー一覧を表示する
  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end