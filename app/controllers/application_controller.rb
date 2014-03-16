class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_filter :set_navbar_info, :set_analytics_info

  protected

  def set_navbar_info
    @navbar_links = [
        { title: t(:home_link_title), link: '/main' },
        { title: t(:solutions_link_title), link: '/services' },
        { title: t(:about_link_title), link: '/about' }
    ]
    @navbar_anchors = [
        { title: t(:contacts_anchor_title), anchor: 'contact' }
    ]
  end

  def set_analytics_info
    @analytics = {
        id: 'UA-6549690-1',
        domain: 'spot.it'
    }
  end

end
