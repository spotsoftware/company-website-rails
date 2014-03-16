class PagesController < ApplicationController

  ALLOWED_PAGES = %i(main about portfolio services)

  def show
    page_id = ALLOWED_PAGES.include?(params['slug'].to_sym) ?
        params['slug'].to_sym :
        raise(ActionController::RoutingError.new('Not Found'))


    self.send(page_id)

    render "pages/#{page_id}"
  end

  protected

  def main
    # TODO
  end

  def about
    @services = [
        {
            icon_name: 'certificate',
            title: t(:about_services_analysis_title),
            details: t(:about_services_analysis_details)
        },
        {
            icon_name: 'question-circle',
            title: t(:about_services_development_title),
            details: t(:about_services_development_details)
        },
        {
            icon_name: 'globe',
            title: t(:about_services_test_title),
            details: t(:about_services_test_details)
        },
        {
            icon_name: 'desktop',
            title: t(:about_services_deployment_title),
            details: t(:about_services_deployment_details)
        },
        {
            icon_name: 'cog',
            title: t(:about_services_maintenance_title),
            details: t(:about_services_maintenance_details)
        }
    ]
  end

  def portfolio
    # TODO
  end

  def services
    # TODO
  end

end
