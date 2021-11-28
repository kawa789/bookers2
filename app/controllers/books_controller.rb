class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id]) 
  end
  
  def edit
    @book = Book.find(params[:id]) 
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)  
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
end
