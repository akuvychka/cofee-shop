class ProductSerializer
  include JSONAPI::Serializer

  set_type :product

  attributes :id, :name, :price, :tax_rate

  has_many :combos
end