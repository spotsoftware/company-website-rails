class PagesController < ApplicationController

  def main
    @title = t(:title_main)
    @meta_description = t(:meta_description_main)
    @services = [
        {
            icon_name: 'mobile',
            name: t(:main_services_mobile_title),
            link: t(:solutions_url)
        },
        {
            icon_name: 'dot-circle-o',
            name: t(:main_services_custom_solutions_title),
            link: t(:solutions_url)
        },
        {
            icon_name: 'laptop',
            name: t(:main_services_web_title),
            link: t(:solutions_url)
        }
    ]

    @portfolio_items = [
        {
            image_name: 'smarthomehackathon.png',
            title: t(:main_portfolio_item_smart_home_hackaton),
            link: 'https://plus.google.com/+SpotIt/posts/3mXpNiVQGaN',
            target: '_blank'
        },
        {
            image_name: 'sports-hackday.jpg',
            title: t(:main_portfolio_items_sports_hackday),
            link: 'https://plus.google.com/109819970051795376614/posts/dL4MhE2xobL',
            target: '_blank'
        },
        {
            image_name: '15.png',
            title: t(:main_portfolio_items_glass_title),
            link: news_url('google-glass')
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

    render_page :main
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

    render_page :about
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

    render_page :services
  end

  def contacts
    @title = t(:title_contacts)
    @meta_description = t(:meta_description_contacts)

    render_page :contacts
  end

  protected

  # Utility used to setup and render a specific page.
  def show_page(page_id)
    self.send(page_id)
  end

  def render_page(page_id)
    render "pages/#{page_id}"
  end

end
