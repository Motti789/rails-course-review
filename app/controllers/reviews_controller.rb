class ReviewsController < ApplicationController
    # skip_before_action :verified_user, only: [:new, :create]

    def index
      @reviews = Review.all
    end
 
    
    
    def new
      @review = Review.new
    end

    def create
       #binding.pry
         #@user = User.find_or_create_by(name: review_params[:review][:name])
         @review = current_user.reviews.build(review_params)
        if @review.save
          redirect_to user_path(@review)
        else
          render 'new'
        end
        
      end

      def show
        # @review = Review.find_by(id:params[:id])
        # @user = current_user
        if @review.blank?
          redirect_to reviews_path
      end
      end

      def edit
        @review = Review.find(params[:id])
      end

      def update
        @review = Review.find(params[:id])
        @review.update(name: params[:review][:name])
        flash[:message] = "Your review has been updated!"
        redirect_to users_path
      end

      def destroy
        Review.find(params[:id]).destroy
        redirect_to reviews_path
      end

    private

    def review_params
        params.require(:review).permit(:name, :course_id)
    end
end