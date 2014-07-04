class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @review = Review.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(user_params)
    if
      @book.save
      flash[:notice] = 'Book saved'
      redirect_to books_path
    else
      flash[:notice] = "Please correct the errors and try again"
      render :new
    end
  end

  def user_params
    params.require(:book).permit(:title, :author, :year, :description, :category)
  end
end
