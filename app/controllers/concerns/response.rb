module Concerns
  module Response
    def json_response(object, status = :ok)
      renderable_obj = object.attributes.except('_id')
      
      if Rails.env.development?
        render body: JSON.pretty_generate(renderable_obj), status: status, content_type: 'application/json'
      else
        render json: renderable_obj, status: status
      end
    end
  end
end