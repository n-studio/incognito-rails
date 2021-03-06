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

    def obfuscated_path
      @obfuscated_path ||= begin
        mount = Incognito.mount_to
        mount.prepend("/") unless mount.start_with?("/") || mount.blank?
        "#{mount}/#{self.uuid}"
      end
    end
  end
end
