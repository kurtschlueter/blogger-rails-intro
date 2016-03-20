class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # @article = Article.new(
    #   title: params[:article][:title],
    #   body: params[:article][:body])

    # @article = Article.new(params[:article]) # this won't work, we need to use a helper instead, with require and permit, we plug in the return of the helper below

    @article = Article.new(article_params)
    @article.user = current_user
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def destroy
    article = Article.find(params[:id])
    flash.notice = "Article '#{article.title}' deleted!"
    article.destroy

    redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
