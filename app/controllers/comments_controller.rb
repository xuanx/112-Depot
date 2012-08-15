class CommentsController < ApplicationController
  def create
      @product = Product.find(params[:product_id]) 
      @comment = @product.comments.new(params[:comment])
      @comment.user_id = session[:user_id]

      if @comment.save
        redirect_to @product

      else
      	flash[:error] = I18n.t('.Comment_cannot_be_blank')
      	redirect_to @product
      end
  end
end
