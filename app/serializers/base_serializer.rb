# frozen_string_literal: true

# Base serializer class
class BaseSerializer
  include JSONAPI::Serializer

  attribute :id
end
