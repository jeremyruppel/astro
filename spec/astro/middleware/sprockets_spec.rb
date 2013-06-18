require 'spec_helper'

describe Astro::Middleware::Sprockets do

  ##
  # Rack-test interface.
  def app
    described_class.new( lambda { |env|
      [ 200, { 'Content-Type' => 'text/plain' }, [ '' ] ]
    } )
  end

  before  { get '/' }
  subject { last_request.env[ 'astro.sprockets' ] }

  it { should be_a( Sprockets::Environment ) }
  it { should have( 2 ).paths }

  it 'has the javascripts directory in the path' do
    subject.paths[ 0 ].should =~ /lib\/assets\/javascripts$/
  end
  it 'has the stylesheets directory in the path' do
    subject.paths[ 1 ].should =~ /lib\/assets\/stylesheets$/
  end
end
