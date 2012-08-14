class AdminController < ApplicationController
  def index
    if current_user.role == 0
      @total_orders = Order.count
    else
      @total_orders = Order.find_all_by_uid(session[:user_id]).length
    end
  end

end
