class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      catalog = params[:catalog]
      if catalog == nil
        @products = Product.all
      else
        @products = []
        catalogs = search catalog
        catalogs.each do |c|
          @products = @products + Product.find_all_by_catalog(c.name)
        end
      end

      @searched = self.search catalog
      @cart = current_cart
    end
  end

  def search catalog
    stack_loop = Catalog.find_all_by_name(catalog)
    children = []

    while !stack_loop.empty?
      catalog = stack_loop.shift
      children = children.push catalog
      if (!catalog.children.empty?)
        stack_loop = catalog.children + stack_loop
      end
    end
    children
  end

end
