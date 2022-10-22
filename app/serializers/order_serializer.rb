class OrderSerializer
  include JSONAPI::Serializer

  set_type :order

  attributes :id, :final_price

  has_many :products
end
