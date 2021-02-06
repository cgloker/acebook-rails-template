class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    

    if @comment.save
      redirect_to posts_path, flash: { success: 'Comment was created successfully!'}
    else  
      redirect_to posts_path, flash: { danger: 'Post was not saved'}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
