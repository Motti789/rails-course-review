class ReviewsController < ApplicationController
    before_action :set_review, except: [:new, :create]

    def index
        @reviews = current_user.reviews.alpha.latest_reviews
    end
  
 
    
    
    def new
      @user = current_user
      @review = @user.reviews.build
      # @review = Review.new(user_id: params[:user_id])
    end

    def create
      @user = current_user
      @review = @user.reviews.build(review_params)
       if @review.save
        redirect_to reviews_path(@review)
       else
        flash[:error] = "Title or review can not be empty. Please try again."
      end
    end

      def show
      end

      def edit
      end

      def update
        set_review
        @review.update(review_params)
        flash[:message] = "Your review has been updated!"
        redirect_to reviews_path
      end

      def destroy
        set_review
        @review.destroy
        flash[:message] = "Your review has been deleted!"
        redirect_to reviews_path
      end

    private

    def set_review
      current_user
      @review = Review.find_by(id: params[:id])
    end
    
    


    def review_params
        params.require(:review).permit(:title, :comment, :course_id, :user_id)
    end
end