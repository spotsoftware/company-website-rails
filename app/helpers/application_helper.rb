module ApplicationHelper

  def javascript_for_specific_page
    javascript_include_tag(asset_path_for_specific_page, media: 'all', 'data-turbolinks-track' => true)
  end

  def stylesheet_for_specific_page
    stylesheet_link_tag(asset_path_for_specific_page, media: 'all', 'data-turbolinks-track' => true)
  end

  def asset_path_for_specific_page
    File.join(
        params[:controller],
        %w(pages news).include?(params[:controller]) ?
            params[:id].gsub('-', '_') :
            params[:action])
  end

end
