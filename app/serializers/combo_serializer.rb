class ComboSerializer
  include JSONAPI::Serializer

  set_type :combo

  attributes :id, :name, :full_price

  has_many :products
end
