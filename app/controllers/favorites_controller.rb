class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book
  
  def create
    # favorite = @book.favorites.new(user_id: current_user.id)
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    # favorite = @book.favorites.find_by(user_id: current_user.id)
    # favorite.destroy
  end
  
  private
  
  def set_book
    @book = Book.find(params[:book_id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :book_id)
  end
end