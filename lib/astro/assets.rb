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

          ##
          # If we're processing the root asset, require all of
          # the assets in the params hash and return the data
          # as-is. The root processed asset will take care of
          # resolving the dependencies.
          sprockets.register_preprocessor 'application/javascript', :astro do |context, data|
            if context.logical_path == 'astro'
              env[ 'astro.assets' ].each do |asset|
                context.require_asset( asset )
              end
            end

            data
          end

          sprockets
        end
      end
    end

    ##
    # Sinatra extension interface.
    def self.registered( app )
      app.helpers Astro::Assets::Helpers

      # development and production environments use assets
      # in `app/assets`.
      app.configure :development, :production do |app|
        app.before do
          assets.append_path 'app/assets/javascripts'
        end
      end

      # the test environment uses assets in `test/assets`.
      app.configure :test do |app|
        app.before do
          assets.append_path 'spec/assets/javascripts'
        end
      end
    end
  end
end
