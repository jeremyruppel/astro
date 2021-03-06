require 'astro/version'

module Astro
  autoload :Assets, 'astro/assets'
  autoload :Server, 'astro/server'

  module Middleware
    autoload :QueryString, 'astro/middleware/query_string'
    autoload :Sprockets,   'astro/middleware/sprockets'
  end
end
