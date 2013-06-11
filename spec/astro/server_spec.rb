require 'spec_helper'

describe Astro::Server do

  ##
  # Rack-test interface compliance.
  def app
    described_class
  end

  describe 'javascripts' do
    subject { last_response }

    context 'empty' do
      before { get '/javascripts' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify { subject.headers } }
      example( 'body'    ){ verify( :format => :js ){ subject.body } }
    end

    context 'foo' do
      before { get '/javascripts', :assets => [ 'foo' ] }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify { subject.headers } }
      example( 'body'    ){ verify( :format => :js ){ subject.body } }
    end

    context 'bar' do
      before { get '/javascripts', :assets => [ 'bar' ] }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify { subject.headers } }
      example( 'body'    ){ verify( :format => :js ){ subject.body } }
    end

    context 'baz' do
      before { get '/javascripts', :assets => [ 'baz' ] }
      its( :status ){ should == 404 }
      example( 'headers' ){ verify { subject.headers } }
      example( 'body'    ){ verify( :format => :js ){ subject.body } }
    end
  end
end
