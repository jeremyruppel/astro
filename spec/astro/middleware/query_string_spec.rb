require 'spec_helper'

describe Astro::Middleware::QueryString do

  ##
  # Rack-test interface.
  def app
    described_class.new( lambda { |env|
      [ 200, { 'Content-Type' => 'text/plain' }, [ '' ] ]
    } )
  end

  subject { last_request.env[ 'astro.assets' ] }

  it 'assigns an empty array when the query string is empty' do
    get '/'
    subject.should == [ ]
  end
  it 'parses one asset name' do
    get '/?foo'
    subject.should == [ 'foo' ]
  end
  it 'parses more than one asset name' do
    get '?foo:bar'
    subject.should == [ 'foo', 'bar' ]
  end
end
