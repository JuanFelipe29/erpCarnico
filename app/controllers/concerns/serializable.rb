module Serializable
  extend ActiveSupport::Concern

  included do
    def serialize(object)
      "#{object.class}Serializer".constantize.new(object)
    end

    def collection_serialize(objects)
      ActiveModel::Serializer::CollectionSerializer.new(objects)
    end
  end
end