class BooksController < ApplicationController
  def new
    @book= Book.new
    @users = User.all
  end

  def create
    @book= Book.new(book_params)
    @book.user_id= current_user.id
   if  @book.save
    flash[:notice] = "投稿が成功しました"
    redirect_to user_path(current_user.id)
   else
      render :users/show
   end
  end

  def index
    @books= Book.all
    @book=Book.new
    @user =User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated"
    redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end



private

   def book_params
   params.require(:book).permit(:book_name, :caption)
   end

end