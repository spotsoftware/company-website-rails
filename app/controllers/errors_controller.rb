class ErrorsController < ApplicationController

  def not_found
    @parts = OpenStruct.new(has_navbar?: true, has_footer?: false, has_social?: false, has_analytics?: false)
    @not_found_path = request.fullpath
    render 'errors/not_found', status: 404
  end

  def server_error
    @parts = OpenStruct.new(has_navbar?: true, has_footer?: false, has_social?: false, has_analytics?: false)
    render 'errors/server_error', status: 500
  end

end
