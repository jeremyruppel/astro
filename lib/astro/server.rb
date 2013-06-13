require 'sinatra/base'

module Astro
  class Server < Sinatra::Base

    register Astro::Assets

    use Astro::Middleware::QueryString
    use Astro::Middleware::Sprockets

    ##
    # TODO docs
    error Sprockets::FileNotFound do
      halt 404, erb( :error )
    end

    ##
    # TODO docs
    before( '/javascripts' ){ content_type 'application/javascript' }

    ##
    # TODO docs
    get( '/javascripts' ){ assets[ 'astro.js' ].to_s }

    # TODO get /javascripts/:name
    # - display available versions?
    # - 3xx if found, 4xx if missing?
    # - display dependency graph?
  end
end
