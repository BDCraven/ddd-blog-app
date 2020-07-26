require 'aggregate_root'

module Posting
  class Post
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def create(title, text)
      apply PostCreated.new(data: { post_id: @id, title: title, text: text })
    end

    on PostCreated do |event|
      @title = event.data[:title]
      @text = event.data[:text]
    end
  end
end
