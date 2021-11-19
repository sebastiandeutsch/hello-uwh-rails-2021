class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash.notice = 'All good'
      redirect_to '/posts'
    else
      flash.alert = 'Something went wrong'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(
      :title,
      :text,
      :keywords
    )
  end
end
