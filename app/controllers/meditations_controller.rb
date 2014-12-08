class MeditationsController < InheritedResources::Base

  def index
    @meditations = Meditation.all.order(:position)
  end

  def show
    @meditation = Meditation.find(params[:id])

    @next = Meditation.find_by_position(@meditation.position + 1)
    @prev = Meditation.find_by_position(@meditation.position - 1)

    unless @meditation.media_url.blank?
      # retrieve embed info from soundcloud
      begin
        sc_client = Soundcloud.new(:client_id => Rails.application.secrets.sc_client_id)
        embed_info = sc_client.get('/oembed', :url => @meditation.media_url, :maxheight => 120,
                                 :show_comments => false, :color => 'C4064E')
        @soundcloud_embed = embed_info['html']
      rescue SoundCloud::ResponseError
        #do nothing, the soundcloud embed will not be displayed
      end
    end
  end
end

