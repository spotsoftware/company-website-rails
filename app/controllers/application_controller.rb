class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_filter :set_info

  protected

  def set_info
    set_locale
    set_navbar_info
    set_analytics_info
  end

  def set_locale
    I18n.locale =
        params[:locale] ||                                                        # 1: Locale parameter
        http_accept_language.compatible_language_from(I18n.available_locales) ||  # 2: Accept-Language HTTP Header
        get_locale_from_geoip ||                                                  # 3: GeoIP
        I18n.default_locale                                                       # 4: Default locale
  end


  @@geoip ||= GeoIP.new(Rails.root.join('db', 'GeoIP.dat'))
  def get_locale_from_geoip
    remote_ip = request.remote_ip

    if remote_ip != "127.0.0.1" # Skip localhost
      location_location = @@geoip.country(remote_ip)
      location_location != nil ? location_location[2] : nil
    end
  end

  def set_navbar_info
    @navbar_links = [
        { title: t(:home_link_title), link: '/', action:'showMain' },
        { title: t(:solutions_link_title), link: t(:solutions_url), action:'showServices' },
        { title: t(:about_link_title), link: t(:about_us_url), action:'showAbout' },
        { title: t(:contacts_link_title), link: t(:contacts_url) , action:'showContacts'}
    ]
    @navbar_anchors = [
        
    ]
  end

  def set_analytics_info
    @analytics = {
        id: 'UA-6549690-1',
        domain: 'spot.it'
    }
  end

end
