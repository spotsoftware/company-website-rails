class ErrorsController < ApplicationController

  def not_found
    @parts = OpenStruct.new(has_navbar?: true, has_footer?: false, has_social?: false, has_analytics?: false)
    @not_found_path = request.fullpath

    respond_to do |format|
      format.html do
        render 'errors/not_found', status: 404
      end
      format.all { render nothing: true, status: 404 }
    end
  end

  def server_error
    @parts = OpenStruct.new(has_navbar?: true, has_footer?: false, has_social?: false, has_analytics?: false)

    respond_to do |format|
      format.html do
        render 'errors/server_error', status: 500
      end
      format.all { render nothing: true, status: 500 }
    end
  end

end
