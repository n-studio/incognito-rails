module ActionDispatch
  module Routing
    class Mapper
      def obfuscate(method, *names)
        names.each do |name|
          [:path, :url].each do |path|
            Incognito::ApplicationHelper.define_method(:"#{name}_#{path}") do |*args, **kwargs|
              obfuscate_params = kwargs.delete(:obfuscate)
              if obfuscate_params
                raise ArgumentError.new("Obfuscated paths require a method") unless obfuscate_params[:method]

                send(:"obfuscated_#{obfuscate_params[:method]}_#{name}_#{path}", *args, **kwargs)
              else
                super(*args, **kwargs)
              end
            end unless Incognito::ApplicationHelper.method_defined?(:"#{name}_#{path}")
          end

          Incognito::ApplicationHelper.define_method(:"obfuscated_#{method.downcase}_#{name}_path") do |*args, **kwargs|
            session[:incognito_session_uuid] ||= SecureRandom.uuid
            Incognito::ObfuscatedPath.find_or_create_by(
              method: method,
              path: Rails.application.routes.url_helpers.send(:"#{name}_path", *args, **kwargs),
              session: session[:incognito_session_uuid],
            ) do |path|
              path.expires_at = 1.month.from_now
            end.obfuscated_path
          end

          Incognito::ApplicationHelper.define_method(:"obfuscated_#{method.downcase}_#{name}_url") do |*args, **kwargs|
            url_for(send(:"obfuscated_#{method.downcase}_#{name}_path", *args, **kwargs))
          end
        end
      end
    end
  end
end
