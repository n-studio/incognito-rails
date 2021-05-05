require "incognito/version"
require "incognito/engine"
require "incognito/action_dispatch/routing/mapper"

module Incognito
  mattr_writer :mount_to

  def self.mount_to
    @@mount_to || "incognito"
  end

  # Your code goes here...
end
