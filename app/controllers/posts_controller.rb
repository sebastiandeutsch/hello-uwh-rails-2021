class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash.notice = "Post updated"
      redirect_to posts_path
    else
      flash.alert = 'Could not update Post'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash.notice = "Post deleted"
      redirect_to posts_path
    else
      flash.alert = "Could not delete Post"
      redirect_to posts_path
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
