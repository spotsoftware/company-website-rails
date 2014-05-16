class NewsController < ApplicationController

  AVAILABLE_NEWS = ['google-glass']

  def show
    @title = t('news.googleglass.title')
    @parts = OpenStruct.new(has_navbar?: true, has_footer?: false, has_social?: false, has_analytics?: true)
    unless params[:id] && AVAILABLE_NEWS.include?(params[:id])
      raise ActionController::RoutingError.new('news unavailable')
    end

    render "/news/#{params[:id].gsub('-', '_')}"
  end

end
