module ActionDispatch
  module Routing
    class Mapper
      def obfuscate_get(name, to:)
        obfuscate_match(name, method: "GET", to: to)
      end

      def obfuscate_post(name, to:)
        obfuscate_match(name, method: "POST", to: to)
      end

      def obfuscate_put(name, to:)
        obfuscate_match(name, method: "PUT", to: to)
      end

      def obfuscate_patch(name, to:)
        obfuscate_match(name, method: "PATCH", to: to)
      end

      def obfuscate_delete(name, to:)
        obfuscate_match(name, method: "DELETE", to: to)
      end

      def obfuscate_match(name, method:, to:)
        Incognito::ApplicationHelper.define_method(:"obfuscated_#{method.downcase}_#{name}_path") do |*args, **kwargs|
          session[:incognito_session_uuid] ||= SecureRandom.uuid
          Incognito::ObfuscatedPath.find_or_create_by(
            method: method,
            path: send(:"#{name}_path", *args, **kwargs),
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
