class HomeController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new
    # post.title = params[:post_title]       # post_title이라는 이름의 내용을 title에 저장
    # post.content = params[:post_content]
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    redirect_to '/home/index'
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    post = Post.find(params[:post_id])
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    redirect_to '/home/index'
  end

  def destroy
    # Post.destroy_all
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to '/home/index'
  end

end
