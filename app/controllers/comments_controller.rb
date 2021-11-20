class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      flash.notice = "Comment saved"
      redirect_to post_path(@post)
    else
      flash.alert = "Comment could not be saved"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash.notice = "Comment deleted"
      redirect_to post_path(@post)
    else
      flash.alert = "Could not delete Comment"
      redirect_to post_path(@post)
    end
  end

private

  def comment_params
    params.require(:comment).permit(
      :text,
      :name,
      :email
    )
  end
end
