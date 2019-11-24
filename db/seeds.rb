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

puts " Created : #{Product.last}"

puts 'Creating curry seeds'

product = Product.new(barcode: 4902970515842, name: 'Lawson Select Beef curry', ingredients: "Beef, sauteed onion, apple paste, beef extract, sauteed potherb (onion, carrot, celery, other), tomato paste, demiglace, sugar, curry powder, oil (plant origin), salt, gram powder, beef oil, chicken extract, ginger, red wine, butter, fond de veau, skim milk powder, dried garlic, colorant (caramel), condiment (amino acid), (contains wheat, milk extract, beef, chicken, pork, apple)")
p image_path("/images/seed/fake_front.jpg")
product.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574405700/food-decoder/fake_front_pgsvzg.jpg'
product.save!


puts " Created : #{Product.last}"

another = Product.new(barcode: 4979450793526, name: 'Hidagyu beef curry', ingredients: "Beef, vegetables(carrot, potato, ginger), wheat, roasted onion, beef oil, lard, milk product (contains soy), curry powder, sugar, apple paste, soy sauce(contains wheat and soy), beef extract, oister sauce(contains soy and apple), butter, salt, tomato paste, potherb, condiment (amino acid), colorant (caramel), acidulant, flavoring agent")
another.remote_front_photo_url = 'https://res.cloudinary.com/do6bcfrqi/image/upload/v1574405701/food-decoder/hidagyu_front_xcrkwb.jpg'
another.save!

puts "Create: #{Product.last}"
# -------------------------------------------

puts "...created #{Product.count} products"

puts 'Cleaning Restrictions '
UserRestriction.destroy_all
Restriction.destroy_all

puts 'Creating restrictions......'

restrictions = ['shrimp', 'crab', 'wheat', 'buckwheat', 'egg', 'milk', 'peanut', 'almond', 'abalone', 'squid', 'fish-egg', 'orange', 'cashew-nut', 'kiwi', 'beef', 'walnut', 'sesame', 'salmon', 'mackerel', 'soy', 'chicken', 'banana', 'pork', 'matsutake', 'peach', 'yam', 'apple', 'gelatin']

restrictions.each do |restriction|
  Restriction.create!(name: restriction, photo: "restrictions_logo/#{restriction}.png")
end

puts "...created #{Restriction.count} restrictions"


