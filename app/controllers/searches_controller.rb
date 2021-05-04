class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      # 完全一致
      if method == "perfect_match"
        @user = User.where(name: content)
      #前方一致
      elsif method == "foward_match"
        @user = User.where("name LIKE?", content+'%')
      #後方一致
      elsif method == "backward_match"
        @user = User.where("name LIKE?", '%'+content)
      #部分一致
      elsif method == "partial_match"
        @user = User.where("name LIKE?", '%'+content+'%')
      else
        @user = User.all
      end
    elsif model == 'book'
      #完全一致
      if method == "perfect_match"
        @book = Book.where(title: content)
      #前方一致
      elsif method == "foward_match"
        @book = Book.where("title LIKE?", content+'%')
      #後方一致
      elsif method == "backward_match"
        @book = Book.where("title LIKE?", '%'+content)
      #部分一致
      elsif method == "partial_match"
        @book = Book.where("title LIKE?", '%'+content+'%')
      else
        @book = Book.all
      end
    end
  end
end