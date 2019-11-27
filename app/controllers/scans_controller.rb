class ScansController < ApplicationController
  require "google/cloud/vision"
  require "google/cloud/translate"

  skip_before_action :authenticate_user!

  def new
    @product = Product.new()
    authorize @product
  end

  def create
    @product = Product.find_by(barcode: params[:barcode])
    if user_signed_in?
      history = History.new()
      history.product = @product
      history.user = current_user
      history.save
    end

    if @product
      if !@product.ingredients.nil?
        authorize @product
        redirect_to product_path(@product)
      else
        redirect_to edit_product_path(@product)
      end
    else
      skip_authorization
      redirect_to new_product_path(barcode: params[:barcode])
    end
  end

  def text_recognition
    @product = Product.find(params[:product_id])
    authorize @product

    # Credentials
    project_id = "food-decoder-259909"
    credentials = ENV["GOOGLE_APPLICATION_CREDENTIALS"]

    # Google Vision
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new(credentials: credentials)

    response = image_annotator.text_detection(
      image: "https://res.cloudinary.com/nst-img/#{@product.label_photo.file.identifier}",
      max_results: 1 # optional, defaults to 10
    )

    # Google Translate
    text          = ""
    language_code = "en"

    response.responses.map do |res|
      label_arr = res.text_annotations.map{ |text| text.description }
      text = label_arr.first.delete "\n"
    end

    Google::Cloud::Translate.configure do |config|
      config.project_id  = project_id
      config.credentials = credentials
    end

    translate   = Google::Cloud::Translate.new version: :v2
    translation = translate.translate text, to: language_code

    @product.label_text = translation.text.inspect
    @product.save

    redirect_to product_label_result_path(@product)
  end

  def result
    @product = Product.find(params[:product_id])
    authorize @product

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
  end

  private

  def scan_params
    params.require(:scan).permit(:barcode)
  end
end
