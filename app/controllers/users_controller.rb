class UsersController < ApplicationController

  def index
    #@user = User.new
    @users = User.all
    @books = Book.all      #追加
    @book = Book.new       #追加
    @user = current_user   #追加
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to books_path
    else
      render :new
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    #redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private

  def book_params
      params.require(:book).permit(:title, :body)
  end

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end

end





