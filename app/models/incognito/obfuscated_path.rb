module Incognito
  class ObfuscatedPath < ActiveRecord::Base
    before_create { self.uuid = SecureRandom.uuid }

    def controller
      path_params[:controller]
    end

    def action
      path_params[:action]
    end

    def path_params
      @path_params ||= Rails.application.routes.recognize_path(self.path, method: self.method)
    end

    def incognito_path
      "/#{Incognito.mount_to}/#{self.uuid}"
    end
  end
end
