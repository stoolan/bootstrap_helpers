require "bootstrap_helpers/helper"
module BootstrapHelpers
  class Railtie < ::Rails::Railtie
    initializer "bootstrap_helpers.helper" do |_app|
      ActionView::Base.send :include, BootstrapHelpers::Helper
    end
  end
end
