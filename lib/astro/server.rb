require 'sinatra/base'

module Astro
  class Server < Sinatra::Base

    configure :development do
      require 'sinatra/reloader'
      register Sinatra::Reloader
    end

    register Astro::Assets

    get '/javascripts' do
      # content_type 'application/javascript' TODO test this
      puts params.inspect
      assets[ 'foo.js' ].to_s
    end

    # TODO get /javascripts/:name
    # - display available versions?
    # - 3xx if found, 4xx if missing?
    # - display dependency graph?
  end
end
