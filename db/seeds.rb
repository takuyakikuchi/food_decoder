include ActionView::Helpers
require 'csv'

puts 'Cleaning Products'
History.destroy_all
Product.destroy_all

puts 'Creating products......'
filepath = 'db/seed_csv.csv'

CSV.foreach(filepath) do |row|
  # puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]}"
  product = Product.new(
    barcode: "#{row[0]}".to_i,
    name: "#{row[1]}",
    ingredients: "#{row[2]}")
    product.remote_front_photo_url ="#{row[3]}"
    product.save!
end

# --------- For barcode scan testing ---------
puts 'Creating candy seeds'

candy = Product.new(barcode: 4902888232374, name: "ramune", ingredients: "glucose, tapioca starch, milk calcium, acidulant, emulsilfier, aroma essence, (contains milk, constituent, and gelatin)")
candy.remote_front_photo_url = "https://res.cloudinary.com/nst-img/image/upload/v1574132180/product_test_1_heaobs.jpg"
candy.save!

puts " Created : #{Product.last.name}"

puts 'Creating curry seeds'

product = Product.new(barcode: 4902970515842, name: 'Lawson Select Beef curry', ingredients: "Beef, sauteed onion, apple paste, beef extract, sauteed potherb (onion, carrot, celery, other), tomato paste, demiglace, sugar, curry powder, oil (plant origin), salt, gram powder, beef oil, chicken extract, ginger, red wine, butter, fond de veau, skim milk powder, dried garlic, colorant (caramel), condiment (amino acid), (contains wheat, milk extract, beef, chicken, pork, apple)")
product.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574405700/food-decoder/fake_front_pgsvzg.jpg'
product.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574405701/food-decoder/fake_label_qboevv.jpg'
product.save!


puts " Created : #{Product.last.name}"

another = Product.new(barcode: 4979450793526, name: 'Hidagyu beef curry', ingredients: "Beef, vegetables(carrot, potato, ginger), wheat, roasted onion, beef oil, lard, milk product (contains soybean), curry powder, sugar, apple paste, soy sauce(contains wheat and soybean), beef extract, oister sauce(contains soybean and apple), butter, salt, tomato paste, potherb, condiment (amino acid), colorant (caramel), acidulant, flavoring agent")
another.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574405701/food-decoder/hidagyu_front_xcrkwb.jpg'
another.remote_label_photo_url = 'https://res.cloudinary.com/nst-img/image/upload/v1574580479/product_test_5_mg5y1i.jpg'
another.save!

puts "Create: #{Product.last.name}"

tomato = Product.new(barcode: 4901306023228, name: 'kagome tomato juice low salt', ingredients: "tomato, salt")
tomato.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919786/food-decoder/0tomato-front_iar4ay.jpg'
tomato.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919785/food-decoder/0tomato-label_xblakd.jpg'
tomato.save!

puts "Create: #{Product.last.name}"

mocchi = Product.new(barcode: 4903423165744, name: 'mocchi choco bread', ingredients: "wheat, coholate flour paste, shortening, chocolate, egg, sugar, chocolate bread, yeast, fermented seasoning, salt, modified fat, starch,
glycine, flavoring agent(including milk, lactose), pH conditioner, polysaccharide thickener, yeast food, sucralose")
mocchi.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919782/food-decoder/0mocchi-choko_qtqhwi.jpg'
mocchi.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919782/food-decoder/0mocchi-choko-label_rm8w4r.jpg'
mocchi.save!

puts "Create: #{Product.last.name}"

yoghurt = Product.new(barcode: 4904741005019, name: 'Jersey Yoghurt', ingredients: "milk, sugar")
yoghurt.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574920964/food-decoder/0homo-yoghurt-front_mmerl1.jpg'
yoghurt.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574920852/food-decoder/0homo-yoghurt-barcode_1_avjtew.jpg'
yoghurt.save!

puts "Create: #{Product.last.name}"

flake = Product.new(barcode: 4904075007000, name: 'Organic corn flake plain', ingredients: "organic corn (non-GMO), organic sugar, organic salt")
flake.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919787/food-decoder/0flake-front_eipu6v.jpg'
flake.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919788/food-decoder/0flake-label_jtqlff.jpg'
flake.save!

puts "Create: #{Product.last.name}"

balm = Product.new(barcode: 4903110261674, name: 'Shittori yawaraka baumkuchen', ingredients: "liquid egg, sugar, wheat, shortening, refined sugar, milk, starch, margarine, phosphor, vegetable oil, protected oil, butter, emulsifying agent, expansive agent, flavoring agent, (contains wheat, milk extract, edd, soybean, wheat) ")
balm.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574920916/food-decoder/0balm-front_t1xcku.jpg'
balm.remote_label_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574919788/food-decoder/0balm-label_qb8wbg.jpg'
balm.save!

puts "Create: #{Product.last.name}"
# -------------------------------------------

puts "...created #{Product.count} products"

puts 'Cleaning Restrictions '
UserRestriction.destroy_all
Restriction.destroy_all

puts 'Creating restrictions......'

restrictions = ['shrimp', 'crab', 'wheat', 'buckwheat', 'egg', 'milk', 'peanut', 'almond', 'abalone', 'squid', 'fish-egg', 'orange', 'cashew-nut', 'kiwi', 'beef', 'walnut', 'sesame', 'salmon', 'mackerel', 'soybean', 'chicken', 'banana', 'pork', 'matsutake', 'peach', 'yam', 'apple', 'gelatin']

restrictions.each do |restriction|
  Restriction.create!(name: restriction, photo: "restrictions_logo/#{restriction}.png")
end

puts "...created #{Restriction.count} restrictions"


