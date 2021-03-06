require 'spec_helper'

describe Astro::Server do

  ##
  # Rack-test interface.
  def app
    described_class
  end

  describe 'javascripts' do
    subject { last_response }

    context 'empty' do
      before { get '/javascripts' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :js  ){ subject.body } }
    end

    context 'foo' do
      before { get '/javascripts?foo' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :js  ){ subject.body } }
    end

    context 'bar' do
      before { get '/javascripts?bar' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :js  ){ subject.body } }
    end

    context 'baz' do
      before { get '/javascripts?baz' }
      its( :status ){ should == 404 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :js  ){ subject.body } }
    end
  end

  describe 'stylesheets' do
    subject { last_response }

    context 'empty' do
      before { get '/stylesheets' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :css ){ subject.body } }
    end

    context 'foo' do
      before { get '/stylesheets?foo' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :css ){ subject.body } }
    end

    context 'bar' do
      before { get '/stylesheets?bar' }
      its( :status ){ should == 200 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :css ){ subject.body } }
    end

    context 'baz' do
      before { get '/stylesheets?baz' }
      its( :status ){ should == 404 }
      example( 'headers' ){ verify( :format => :txt ){ subject.headers } }
      example( 'body'    ){ verify( :format => :css ){ subject.body } }
    end
  end
end
