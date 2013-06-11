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

      example 'headers' do
        verify { subject.headers }
      end
      example 'body' do
        verify( :format => :js ){ subject.body }
      end
    end

    context 'foo' do
      before { get '/javascripts', :assets => [ 'foo' ] }

      its( :status ){ should == 200 }

      example 'headers' do
        verify { subject.headers }
      end
      example 'body' do
        verify( :format => :js ){ subject.body }
      end
    end
  end
end
