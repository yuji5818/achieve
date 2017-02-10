class BlogsController < ApplicationController
 before_action :authenticate_user!
 before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end


  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end


  def new
   if params[:back]
    @blog = Blog.new(blogs_params)
   else
    @blog = Blog.new
   end
  end

  def confirm
   @blog = Blog.new(blogs_params)
   render :new if @blog.invalid?
  end

  def create
    @blog = current_user.blogs.build(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    if @blog.save
    redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    @blogs = Blog.all
    render  'index', notice:"ブログを削除しました！"
  end

  private
    def blogs_params
     params.require(:blog).permit(:title, :content)
    end

    def set_blog
     @blog = Blog.find(params[:id])
    end
end
