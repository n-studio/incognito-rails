module ActionDispatch
  module Routing
    class Mapper
      def incognito_get(name, to:)
        incognito_match(name, method: "GET", to: to)
      end

      def incognito_post(name, to:)
        incognito_match(name, method: "POST", to: to)
      end

      def incognito_put(name, to:)
        incognito_match(name, method: "PUT", to: to)
      end

      def incognito_patch(name, to:)
        incognito_match(name, method: "PATCH", to: to)
      end

      def incognito_delete(name, to:)
        incognito_match(name, method: "DELETE", to: to)
      end

      def incognito_match(name, method:, to:)
        Incognito::ApplicationHelper.define_method(:"incognito_#{method.downcase}_#{name}_path") do |*args, **kwargs|
          session[:incognito_session_uuid] ||= SecureRandom.uuid
          Incognito::ObfuscatedPath.find_or_create_by(
            method: method,
            path: send(:"#{name}_path", *args, **kwargs),
            session: session[:incognito_session_uuid],
          ) do |path|
            path.expires_at = 1.month.from_now
          end.incognito_path
        end

        Incognito::ApplicationHelper.define_method(:"incognito_#{method.downcase}_#{name}_url") do |*args, **kwargs|
          url_for(send(:"incognito_#{method.downcase}_#{name}_path", *args, **kwargs))
        end
      end
    end
  end
end
