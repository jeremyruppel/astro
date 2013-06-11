require 'sprockets'

module Astro
  module Middleware
    class Sprockets

      def initialize( app )
        @app = app
      end

      ##
      # Creates a new sprockets environment instance
      # and adds an anonymous preprocessor to require
      # dependencies from the `astro.assets` array.
      def call( env )
        sprockets = ::Sprockets::Environment.new
        sprockets.append_path 'lib/assets/javascripts'

        env[ 'astro.sprockets' ] = sprockets

        @app.call env
      end
    end
  end
end
