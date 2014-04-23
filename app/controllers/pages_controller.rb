class PagesController < ApplicationController

  ALLOWED_PAGES = %i(main about services)


  def showMain
    page_id = "main"

    self.send(page_id)
    render_page page_id
  end

  def showAbout
    page_id = "about"
    raise Exception.new
    self.send(page_id)
    render_page page_id
  end

  def showServices
    page_id = "services"

    self.send(page_id)
    render_page page_id
  end

  def showContacts
    page_id = "contacts"

    self.send(page_id)
    render_page page_id
  end

  protected

  def main
    @title = t(:title_main)
    @meta_description = t(:meta_description_main)
    @services = [
        {
            icon_name: 'mobile',
            name: t(:main_services_mobile_title)
        },
        {
            icon_name: 'dot-circle-o',
            name: t(:main_services_custom_solutions_title)
        },
        {
            icon_name: 'laptop',
            name: t(:main_services_web_title)
        }
    ]

    @portfolio_items = [
        {
            image_name: '15.png',
            title: t(:main_portfolio_items_glass_title)
        },
        {
            image_name: '4.png',
            title: t(:main_portfolio_items_echo_nest_title)
        },
        {
            image_name: '12.png',
            title: t(:main_portfolio_items_leap_motion_title)
        },
        {
            image_name: '13.png',
            title: t(:main_portfolio_items_chromecast_title)
        },
        {
            image_name: '2.jpg',
            title: t(:main_portfolio_items_pebble_title)
        }
    ]

    @partners = [
        { image_name: 'c01.gif' },
        { image_name: 'c02.gif' },
        { image_name: 'c03.gif' },
        { image_name: 'c04.gif' }
    ]
  end

  def about
    @title = t(:title_about)
    @meta_description = t(:meta_description_about)
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

  def services
    @title = t(:title_services)
    @meta_description = t(:meta_description_services)
    @services = [
        {
            title: t(:services_mobile_title),
            description: t(:services_mobile_description)
        },
        {
            title: t(:services_custom_projects_title),
            description: t(:services_custom_projects_description)
        },
        {
            title: t(:services_web_title),
            description: t(:services_web_description)
        }
    ]
  end

  def contacts
    @title = t(:title_contacts)
    @meta_description = t(:meta_description_contacts)
  end

  def render_page(page_id)
    render "pages/#{page_id}"
  end

end
