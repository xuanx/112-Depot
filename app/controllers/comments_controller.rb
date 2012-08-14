class CommentsController < ApplicationController
  def create
      @product = Product.find(params[:product_id]) 
      @comment = @product.comments.new(params[:comment])
      @comment.user_id = session[:user_id]

      if @comment.save
        redirect_to @product

      else
      	flash[:error] = "Comment can't be blank!"
      	redirect_to @product
      end
  end
end
