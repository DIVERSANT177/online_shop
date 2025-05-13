# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.delete_all

Product.create!(title: 'Товар1',
description:
"
  Подробное описание первого товара
",
image_url: 'ruby.jpg',
price: 12.25)

Product.create!(title: 'Товар2',
description:
%(
  Подробное описание второго товара
),
image_url: 'ruby.jpg',
price: 20.25)

Product.create!(title: 'Товар3',
description:
%(
  Подробное описание третьего товара
),
image_url: 'ruby.jpg',
price: 123)
