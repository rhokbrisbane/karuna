class MeditationsController < InheritedResources::Base

  private

    def meditation_params
      params.require(:meditation).permit(:name, :description, :media_url)
    end
end

