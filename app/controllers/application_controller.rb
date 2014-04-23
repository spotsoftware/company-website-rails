require 'ostruct'


class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_filter :set_info

  #if Rails.env.production?

  rescue_from Exception do |exception|
    render controller: 'errors', action: 'server_error'
  end

  [ ActionController::RoutingError,
    ActionController::UnknownController,
    ActiveRecord::RecordNotFound].each do |exception_class|
      rescue_from exception_class do |exception|
        render controller: 'errors', action: 'not_found'
      end
  end

  #end

  protected

  def set_info
    set_default_parts

    set_locale
    set_navbar_info
    set_analytics_info
  end

  def set_default_parts
    @parts = OpenStruct.new(
      has_navbar?: true,
      has_footer?: true,
      has_social?: true,
      has_analytics?: true)
  end

  def set_locale
    locale = params[:locale] ? params[:locale].to_sym : nil
    I18n.locale = if locale and I18n.available_locales.include?(locale) # 1: Locale parameter
      params[:locale]
    else
      request_locale = http_accept_language.compatible_language_from(I18n.available_locales)
      if request_locale # 2: Accept-Language HTTP Header
        request_locale
      else # 3: Default locale
        I18n.default_locale
      end
    end

  end

  # @@geoip ||= GeoIP.new(Rails.root.join('db', 'GeoIP.dat'))
  # def get_locale_from_geoip
  #   return nil if request.nil? or request.remote_ip.nil?

  #   remote_ip = request.remote_ip

  #   if remote_ip != "127.0.0.1" # Skip localhost
  #     location_location = @@geoip.country(remote_ip)
  #     location_location != nil ? location_location[2] : nil
  #   end
  # end

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
