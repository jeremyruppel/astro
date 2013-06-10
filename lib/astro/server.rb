require 'sinatra/base'

module Astro
  class Server < Sinatra::Base

    get '/' do
      'foo!'
    end
  end
end
