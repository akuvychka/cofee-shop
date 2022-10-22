class ComboSerializer
  include JSONAPI::Serializer

  set_type :combo

  attributes :id, :name
end