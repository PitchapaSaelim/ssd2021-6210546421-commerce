class HomeController < ApplicationController
  # def index
  #   @search = params[:search]

  #   @products = Product.all
  #   @products = @products
  #     .search(@search) if @search.present?
  #   @products = @products.page(params[:page]).per(9)
  # end
      # GET /products or /products.json
    def index
      @categories = Category.all
      @products = Product.all
      @search = params[:search]

      @products = @products
        .search(@search) if @search.present?
      @products = @products.page(params[:page]).per(6)

      respond_to do |format|
        format.html
        format.csv{ send_data generate_csv(Product.all), file_name: 'products.csv' }
      end
    end
end