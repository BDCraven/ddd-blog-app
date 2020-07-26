class PostsController < ApplicationController

  def index
    # @posts = Post.all
    @posts = Posts::Post.all
  end

  def show
    # @post = Post.find(params[:id])
    @post = Posts::Post.find(params[:id])
  end

  def new
    @post_id = SecureRandom.uuid
  end

  def create
    # @post = Post.new(params.require(:post).permit(:title, :text))
    # @post.save
    # redirect_to @post

    cmd = Posting::CreatePost.new(post_id: post_params[:post_id], title: post_params[:title], text: post_params[:text])
    command_bus.(cmd)
    redirect_to post_path(Posts::Post.find_by_uid(cmd.post_id)), notice: 'Post was successfully submitted.'
  end

  def post_params
    params.require(:post).permit(:post_id, :title, :text)
  end
end
