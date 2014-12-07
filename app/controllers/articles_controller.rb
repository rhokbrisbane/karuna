class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @next = Article.find_by_group_id_and_position(@article.group, @article.position + 1)
    @prev = Article.find_by_group_id_and_position(@article.group, @article.position - 1)
    unless @article.video_link.blank?
      #parse Youtube id from url
      video_url = URI.parse(@article.video_link)
      @video_id = Rack::Utils.parse_nested_query(video_url.query)["v"]
    end
    unless @article.audio_link.blank?
      # retrieve embed info from soundcloud
      begin
        sc_client = Soundcloud.new(:client_id => Rails.application.secrets.sc_client_id)
        embed_info = sc_client.get('/oembed', :url => @article.audio_link, :iframe => false,
                                 :show_comments => false, :color => 'C4064E')
        @soundcloud_embed = embed_info['html']
      rescue SoundCloud::ResponseError
        #do nothing, the soundcloud embed will not be displayed
      end
    end
  end
end
