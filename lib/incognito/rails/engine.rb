module Incognito
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Incognito::Rails
    end
  end
end
