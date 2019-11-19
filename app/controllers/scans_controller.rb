class ScansController < ApplicationController
    def create
        @product = Product.find_by(barcode: params[:barcode])
        redirect_to product_path(@product)
    end

    private

    def scan_params
        params.require(:scan).permit(:barcode)
    end
end
