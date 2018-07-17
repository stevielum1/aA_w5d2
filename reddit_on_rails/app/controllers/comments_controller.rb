class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    #@comment.parent_comment_id = params[:id]
    #parent_comment = Comment.find_by(id: params:id)
    #@comment.post_id = parent_comment.post_id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
