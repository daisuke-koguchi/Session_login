class BlogsController < ApplicationController
  def index
    @blog = Blog.all
    @user = @blog.user.name
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      #成功時
      redirect_to blogs_path,notice: "ブログを作成する"
    else
      #成功時
      render :new
    end
  end
  def show
    @blog = Blog.find(params[:id])
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集する"
    else
      render :edit
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path,notice: "ブログを削除する"
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end