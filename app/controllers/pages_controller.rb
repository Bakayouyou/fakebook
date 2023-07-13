class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @users = User.all
    @posts = Post.all.sort_by { |post| post.created_at }.reverse
    @user = current_user
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
    @like.user = current_user
    @comment.post = @post
  end

  def profile
    @users = User.all
    @post = Post.new
    if params[:format]
      @user = User.find(params[:format])
      @chatroom = Chatroom.find_by(id: params[:chatroom_id])

    else
      @user = current_user
      @chatroom = Chatroom.find_by(id: params[:chatroom_id])
    end
    @posts = @user.posts.sort_by { |post| post.created_at }.reverse
    @comment = Comment.new
    @comment.post = @post
  end
end
