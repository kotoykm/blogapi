class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all()
    render json: @articles, status: 200
  end

  def show
    @article = Article.find(params[:id])
    if @article
      render json: @article, status: 200
    else
      render json: {error: "NO EXITE BOBO XD"}
    end
  end

  def create
    @article = Article.new(article_params())

    if @article.save
      render json: @article, status: 200
    else
      render json: {error: "QUE BOBO XD"}
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article
      @article.update(article_params)
      render json: "Editado con éxito!"
    else
      render json: {error: "QUE BOBO XD"}
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article
      @article.destroy()
      render json: "Se jueeee"
    else
      render json: {error: "QUE BOBO XD"}
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :author)
  end

end
