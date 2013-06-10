require 'sprockets'

module Astro

  ##
  # A simple sinatra extension to create and manage
  # a sprockets environment.
  module Assets

    ##
    #
    module Helpers

      ##
      # The sprockets environment instance.
      def assets
        @assets ||= begin
          sprockets = Sprockets::Environment.new
          sprockets.append_path 'lib/assets/javascripts'
          sprockets
        end
      end
    end

    ##
    # Sinatra extension interface.
    def self.registered( app )
      app.helpers Astro::Assets::Helpers
    end
  end
end