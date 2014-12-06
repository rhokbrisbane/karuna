class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    unless @article.video_link.blank?
      video_url = URI.parse(@article.video_link)
      @video_id = Rack::Utils.parse_nested_query(video_url.query)["v"]
    end
  end
end
