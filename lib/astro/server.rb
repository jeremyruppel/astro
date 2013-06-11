require 'sinatra/base'

module Astro
  class Server < Sinatra::Base

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader

      enable :dump_errors
      enable :raise_errors
      disable :show_exceptions
    end

    register Astro::Assets

    ##
    #
    get '/javascripts' do
      assets[ 'astro.js' ].tap do |asset|
        content_type asset.content_type
      end.to_s
    end

    # TODO rescue Sprockets::FileNotFound

    # TODO get /javascripts/:name
    # - display available versions?
    # - 3xx if found, 4xx if missing?
    # - display dependency graph?
  end
end
