require "incognito/version"
require "incognito/engine"
require "incognito/action_dispatch/routing/mapper"

module Incognito
  mattr_writer :mount_to
  mattr_accessor :default_expires_at

  def self.mount_to
    @@mount_to || "incognito"
  end
end
