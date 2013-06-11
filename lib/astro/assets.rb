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
          env = Sprockets::Environment.new
          env.append_path 'lib/assets/javascripts'

          ##
          # If we're processing the root asset, require all of
          # the assets in the params hash and return the data
          # as-is. The root processed asset will take care of
          # resolving the dependencies.
          env.register_preprocessor 'application/javascript', :astro do |context, data|
            if context.logical_path == 'astro'
              params[ :assets ].each do |asset|
                context.require_asset( asset )
              end
            end

            data
          end

          env
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