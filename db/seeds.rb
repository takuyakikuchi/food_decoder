candy = Product.new(barcode: 4902888232374, name: "ramune", ingredients: "glucose, tapioca starch, milk calcium, acidulant, emulsilfier, aroma essence, containing milk constituent and gelatin")
candy.remote_front_photo_url = "https://res.cloudinary.com/nst-img/image/upload/v1574132180/product_test_1_heaobs.jpg"
candy.save!