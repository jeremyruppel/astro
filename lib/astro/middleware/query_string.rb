module Astro
  module Middleware
    class QueryString

      def initialize( app )
        @app = app
      end

      ##
      # Parses the asset list query string format into an
      # array of assets and assigns it to `env`. Currently,
      # asset names are simply separated by commas.
      def call( env )
        req = Rack::Request.new( env )
        str = Rack::Utils.unescape( req.query_string )

        # TODO config
        env[ 'astro.assets' ] = str.split ','

        @app.call env
      end
    end
  end
end
