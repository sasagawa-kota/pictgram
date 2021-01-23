class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  def new
    @topic = Topic.find_by(params[:topics_id])
    @comment = Comment.new
  end
  
  def create
    @comment = current_user.comment.new(comment_params)
    
    if @comment.save
      redirect_to comments_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
    
    private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
  
