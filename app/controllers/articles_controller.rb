class ArticlesController < ApplicationController

  def index
    @articles = Article.search(params[:q]).ordering(params[:sort_mode])
    respond_to do |format|
      format.json { render json: @articles }
      format.html { render 'index' }
    end
  end

  def create
    @article = Article.new(article_params)
    # byebug
    unless(@article.save)
      flash[:error] = "Error: Cannot create new article"
      render 'new'
    else
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])

    if (article.update(article_params).present?)
      redirect_to article_path(params[:id])
    else
      render 'edit'
    end
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
