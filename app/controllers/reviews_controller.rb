class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_resource
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.resource = @resource

    if @review.save
      redirect_to @resource, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
      redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_resource
      @resource = Resource.find(params[:resource_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
