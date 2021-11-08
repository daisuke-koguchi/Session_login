class BlogsController < ApplicationController
  def index
    @blog = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      #成功時
      redirect_to blogs_path
    else
      #成功時
      render :new
    end
  end
  def show
    @blog = Blog.find(params[:id])
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
