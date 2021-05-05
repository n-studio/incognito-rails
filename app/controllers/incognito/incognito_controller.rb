class Incognito::IncognitoController < ActionController::Base
  def show
    obfuscated_path = Incognito::ObfuscatedPath.find_by(uuid: params[:uuid], session: session[:incognito_session_uuid])
    controller = "#{obfuscated_path.controller}_controller".camelize.constantize.new
    controller.request = request
    controller.response = response
    controller.params = controller.params.merge(obfuscated_path.path_params)
    controller.process(obfuscated_path.action.to_sym)
    render html: controller.response_body.first
  end
end
