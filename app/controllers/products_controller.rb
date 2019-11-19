class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update]

    def show
    end

    def new
        @product = Product.new()
    end

    def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to product_path(@product)
        else
          render :new
        end
    end

    def edit
    end

    def update
        @product.update(product_params)
        redirect_to product_path(@product)
    end

    private

    def set_product
        @product = Product.find_by(barcode: params[:barcode])
    end

    def product_params
        params.require(:product).permit(:name, :label_photo, :front_photo)
    end
end
