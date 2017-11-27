class ArticlesController < ApplicationController
  before_action :define_which_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @all_articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Successfully created Article"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Successfully updated Article"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was DELETED"
    redirect_to articles_path
  end
  
  private
    def define_which_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end
end