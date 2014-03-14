class PagesController < ApplicationController

  ALLOWED_PAGES = %i(about portfolio services)
  DEFAULT_PAGE = :about

  def show
    page_id = ALLOWED_PAGES.include?(params['slug'].to_sym) ?
        params['slug'].to_sym :
        raise(ActionController::RoutingError.new('Not Found'))
    Rails.logger.info params
    render "pages/#{page_id}"
  end

end
