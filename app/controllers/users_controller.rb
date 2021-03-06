class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only: [:edit,:update]

  def index
    #@user = User.new
    @book = current_user #追加
    @users = User.all
    @books = Book.all
    @book_new = Book.new
    @user = current_user
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
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
      #redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private


  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def  ensure_current_user
        @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to user_path(current_user.id)

     end
  end

end





