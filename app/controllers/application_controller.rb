class ApplicationController < ActionController::Base
  def render_json_validation_error(resource)
    render json: resource, status: :bad_request,
           serializer: ::ErrorSerializer
  end
end
