class UsersController < ApplicationController
  
  def index
    @user = User.new
    @users = User.all
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
    @user = User.find(params[:id])
    @books = @user.books(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end


