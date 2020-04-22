class BooksController < ApplicationController

    def index
    	@books = Book.all
    	@book = Book.new
    	@user = current_user
    end

    def show
    	@book2 = Book.find(params[:id])
    	@user = @book2.user
    	@book = Book.new
    end


    def create
    	book = Book.new(book_params)
    	book.user_id = current_user.id
  		if book.save #ここで保存される。
			flash[:notice] = "successfully created book!" #サクセスメッセージの生成
  		redirect_to book_path(book.id)
  		else
  			@books = Book.all
  			@book = book
      	@user = current_user
  			render :index
  		end
  	end

	def edit
		@book = Book.find(params[:id])
		@book3 = Book.new
		if current_user != @book.user
			redirect_to books_path
		end
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:notice] = "successfully updated book!"
  			redirect_to book_path(book)
  		else
      		@book = Book.find(params[:id])
      		@book3 = book
  			  render :edit
  		end
	end

	def destroy
		book = Book.find(params[:id])
  		book.destroy
        flash[:notice] = "successfully delete book!"
  		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
