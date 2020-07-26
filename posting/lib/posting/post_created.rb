module Posting
  class PostCreated < Event
    attribute :post_id, Types::UUID
    attribute :title, Types::String
    attribute :text, Types::String

    alias :aggregate_id :post_id
  end
end
