# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.create(name: 'Espresso', price: 5, tax_rate: 0.08, storage_amount: 5) if Product.where(name: 'Espresso').empty?
Product.create(name: 'Mocka', price: 10, tax_rate: 0.08, storage_amount: 3) if Product.where(name: 'Mocka').empty?
Product.create(name: 'Bagel', price: 7, tax_rate: 0.03, storage_amount: 2) if Product.where(name: 'Bagel').empty?

Discount.new(discount_type: :percent, amount: 10).save if Discount.where(discount_type: :percent, amount: 10).empty?
Discount.new(discount_type: :amount, amount: 7).save if Discount.where(discount_type: :amount, amount: 7).empty?

if Combo.where(name: 'Espresso + Bagel').empty?
  combo = Combo.create(name: 'Espresso + Bagel')
  product = Product.where(name: 'Espresso').first
  ProductCombo.create(product_id: product.id, combo_id: combo.id)
  product = Product.where(name: 'Bagel').first
  discount = Discount.where(discount_type: :percent, amount: 10).first
  ProductCombo.create(product_id: product.id, combo_id: combo.id, discount_id: discount.id)
end

if Combo.where(name: 'Mocka + Bagel').empty?
  combo = Combo.create(name: 'Mocka + Bagel')
  product = Product.where(name: 'Mocka').first
  ProductCombo.create(product_id: product.id, combo_id: combo.id)
  product = Product.where(name: 'Bagel').first
  discount = Discount.where(discount_type: :amount, amount: 7).first
  ProductCombo.create(product_id: product.id, combo_id: combo.id, discount_id: discount.id)
end

Customer.create(first_name: 'F Name', contact_type: 'email', contact: 'email@email.email') if Customer.count.zero?
