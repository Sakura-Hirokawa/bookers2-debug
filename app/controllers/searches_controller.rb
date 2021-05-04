class SearchesController < ApplicationController
  def search
    # 完全一致
    if params[:content].present? && params[:model] === "User" && params[:method] === "perfect"
			@users = User.where('name LIKE ?', "#{params[:content]}")

		# 前方一致
		elsif params[:content].present? && params[:model] === "User" && params[:method] === "forward"
			@users = User.where('name LIKE ?', "#{params[:content]}%")

		# 後方一致
		elsif params[:content].present? && params[:model] === "User" && params[:method] === "backward"
			@users = User.where('name LIKE ?', "%#{params[:content]}")

		# 部分一致
		elsif params[:content].present? && params[:model] === "User" && params[:method] === "partial"
			@users = User.where('name LIKE ?', "%#{params[:content]}%")
    end

    # 完全一致
    if params[:content].present? && params[:model] === "Book" && params[:method] === "perfect"
      @books = Book.where('title LIKE ?', "#{params[:content]}")

    # 前方一致
		elsif params[:content].present? && params[:model] === "Book" && params[:method] === "forward"
		  @books = Book.where('title LIKE ?', "#{params[:content]}%")

	  # 後方一致
	  elsif params[:content].present? && params[:model] === "Book" && params[:method] === "backward"
	    @books = Book.where('title LIKE ?', "%#{params[:content]}")

	   # 部分一致
		elsif params[:content].present? && params[:model] === "Book" && params[:method] === "partial"
		  @books = Book.where('title LIKE ?', "%#{params[:content]}%")
		end
  end
end