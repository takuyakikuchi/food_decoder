class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :bookmark]
  skip_before_action :authenticate_user!

  def show
    restrictions = Restriction.all.first(28)
    if user_signed_in?
      @allergens = current_user.restrictions.map do |restriction|
        restriction.name
      end
    else
      @allergens = restrictions.map do |restriction|
        restriction.name
      end
    end
    @all_restrictions = restrictions.map do |restriction|
      restriction.name
    end
    @history = History.find_by(user_id: current_user, product_id: @product)
  end

  def bookmark
    history = History.find_by(user_id: current_user, product_id: @product)
    history.favorite = !history.favorite
    history.save

    redirect_to product_path(@product)
  end

  def new
    if params[:barcode] # @barcode should not be nil
      @product = Product.new(barcode: params[:barcode]) #barcode should act as placeholder
    else
      @product = Product.new()
    end
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
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
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:barcode, :name, :ingredients, :label_photo, :front_photo)
  end
end
