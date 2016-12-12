class ArticlesController < ApplicationController
    def require_logged_in
        user = User.find_by_id(session[:user_id])

        redirect_to login_path if user.blank?
    end

    before_action :require_logged_in

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
        if @article.save
            redirect_to articles_path
        else
            flash[:error] = 'Error: Cannot create new article'
            render 'new'
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

        if article.update(article_params).present?
            redirect_to article_path(params[:id])
        else
            render 'edit'
        end
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
