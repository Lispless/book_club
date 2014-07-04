class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book

    if @review.save
      flash[:notice] = "Review has been added"
      redirect_to book_path(@book)
    else
      flash[:notice] = "Review did not go through!"
      redirect_to book_path(@book)
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
