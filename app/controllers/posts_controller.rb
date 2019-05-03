class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]
  def index
    @posts = Post.order(created_at: :desc)
    @new_post = Post.order(created_at: :desc).limit(5)
    @author = Author.first
  end

  def show
    
  end

  def new
    # Postモデルのインスタンスを生成
    @post = Post.new
  end

  def create
    # postモデルのインスタンスを作成(ストロングパラメータでデータを取得)
    @post = Post.new(post_params)
    # セーブする
    @post.save
    # showページにリダイレク
    redirect_to @post
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

    # プライベートメソッドでストロングパラメータを作成
    private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end