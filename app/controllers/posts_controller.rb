class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end
  def new 
    @posts = Post.new
  end
  def create
    @posts  = Post.new(post_params)
    
    if @posts.save
      redirect_to @posts
    else
      render "new"
    end
  end
  def show
    @posts = Post.find(params[:id])
  end

    def update
      @posts = Post.find(params[:id])
      if @posts.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    end
    def edit
      @posts = Post.find(params[:id])
    end
  def destroy

  end

private
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
end
