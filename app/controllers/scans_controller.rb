class ScansController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @product = Product.new()
    authorize @product
  end

  def create
    @product = Product.find_by(barcode: params[:barcode])
    authorize @product
    redirect_to product_path(@product)
  end

  private

  def scan_params
    params.require(:scan).permit(:barcode)
  end
end
