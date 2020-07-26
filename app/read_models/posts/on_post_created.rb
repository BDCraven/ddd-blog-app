module Posts
  class OnPostCreated
    def call(event)
      # post = Post.find_by(uid: event.data[:post_id])
      # post = Post.find(event.data[:post_id])
    
      post = Post.new
      post.uid = event.data[:post_id]
      post.title = event.data[:title]
      post.text = event.data[:text]
      post.save!
    end
  end
end
