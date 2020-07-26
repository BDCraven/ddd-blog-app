module Posting
  class OnCreatePost
    include CommandHandler

    def call(command)
      with_aggregate(Post, command.aggregate_id) do |post|
        post.create(command.title, command.text)
      end
    end

  end
end
