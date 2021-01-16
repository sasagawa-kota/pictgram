class TopicsController < ApplicationController
  def index
    @topics =Topic.all
  end
  
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_parmas)
    
    if @topic.seve
      redirect_to topic_path, success: '投稿に成功しました'
    else
      flash[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def topic_parmas
    parmas.require(:topic).permit(:image, :description)
  end
end
