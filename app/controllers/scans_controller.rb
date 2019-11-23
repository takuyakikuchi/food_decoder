class ScansController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @product = Product.new()
    authorize @product
  end

  def create
    @product = Product.find_by(barcode: params[:barcode])
    if @product
      authorize @product
      redirect_to product_path(@product)
    else
      @product = params[:barcode]
      skip_authorization
      redirect_to new_product_path(@product)
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:barcode)
  end
end
