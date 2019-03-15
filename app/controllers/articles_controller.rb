class ArticlesController < ApplicationController
  before_action :login_required, except:[:index, :show]

  def index
    @articles=Article.order(released_at: :desc)
    @articles=@articles.open_to_the_public unless current_member
    @articles=@articles.visible unless current_member&.administrator?
    @articles=@articles.page(params[:page]).per(5)
  end

  def show
    @articles=Article.order(released_at: :desc)
    @articles=@articles.open_to_the_public unless current_member
    @articles=@articles.visible unless current_member&.administrator?
    @article=@articles.find(params[:id])
  end

  def new
    @article=Article.new
  end

  def edit
    @article=Article.find(params[:id])
  end

  def create
    @article=Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "記事が投稿されました"
    else
      render "new"
    end
  end

  def update
    @article=Article.find(params[:id])
    @article.assign_attributes(params[:article]) # form_for @memberなので全編集データをparams[article]で受け取れる
    if @article.save
      redirect_to @article, notice: '記事を更新しました'
    else
      render 'edit'
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to :articles, notice: "記事を削除しました"
  end
end
