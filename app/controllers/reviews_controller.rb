class ReviewsController < ApplicationController
    # skip_before_action :verified_user, only: [:new, :create]

    def index
      @reviews = Review.all
    end
 
    
    
    def new
      @review = Review.new
    end

    def create
       @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to reviews_path(current_user)
      else
        render 'new'
      end
    end

      def show
       set_review
       @user = current_user
      end

      def edit
       set_review
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
      @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:title, :comment, :course_id)
    end
end