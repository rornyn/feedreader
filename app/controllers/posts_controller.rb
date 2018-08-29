class PostsController < ApplicationController

  def index
    @posts = Post.all.includes(:feed).order('created_at desc')
  end
end
