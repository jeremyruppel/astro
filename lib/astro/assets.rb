require 'sprockets'

module Astro

  ##
  # A simple sinatra extension to set up the sprockets environment.
  module Assets

    ##
    # Sinatra extension interface.
    def self.registered( app )
      app.helpers do

        ##
        # The sprockets environment instance.
        def assets
          env[ 'astro.sprockets' ]
        end
      end

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

      app.before do
        assets.register_preprocessor \
          'application/javascript', :astro do |context, data|

          ##
          # If we're processing the root asset, require all of
          # the assets in the assets list and return the data
          # as-is. The root processed asset will take care of
          # resolving the dependencies.
          if context.logical_path == 'astro'
            env[ 'astro.assets' ].each do |asset|
              context.require_asset( asset )
            end
          end

          data
        end
      end

    end
  end
end
