class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    
    if @range == '1'
      @user = User.search(search, word)
    else
      @book = Book.search(search, word)
    end
  end
  
  private
  
  def search_for(search, word)
     #完全一致
    if search == "perfect_match"
      @user = User.where("#{word}")
      #前方一致
    elsif search == "foward_match"
      @user = User.where("name LIKE?", "#{word}%")
      #後方一致
    elsif search == "backward_match" 
      @user = User.where("name LIKE?", "%#{word}")
      #部分一致
    elsif search == "partial_match" 
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
  
  def search_for
    #完全一致
    if search == "perfect_match"
      @book = Book.where("#{word}")
      #前方一致
    elsif search == "foward_match"
      @book = Book.where("title LIKE?", "#{word}%"
      #後方一致
    elsif search == "backward_match"
      @book = Book.where("title LIKE?", "%#{word}")
      #部分一致
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{word}%")
    else
      @book = Book.all
    end
  end
end