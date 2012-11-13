require "localmotive/version"

module Localmotive
  class Railtie < ::Rails::Railtie

    def self.maybe_load(app, filename)
      path = app.root.join('.local/config', filename)
      if path.exist?
        load path
      end
    end

    def maybe_load(app, filename)
      self.class.maybe_load(app, filename)
    end

    config.before_initialize do |app|
      maybe_load app, "application.rb"
      maybe_load app, "environments/#{Rails.env}.rb"
    end

  end
end
