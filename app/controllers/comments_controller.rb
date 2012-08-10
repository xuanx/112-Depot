class CommentsController < ApplicationController
  def create
      @product = Product.find(params[:product_id])
      @comment = @product.comments.new(params[:comment])

      if @comment.save
        redirect_to @product
      end
  end
end
