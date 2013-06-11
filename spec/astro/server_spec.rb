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

      # TODO approval
      example 'body' do
        subject.body.should == "/**\n * Welcome to astro.js!\n */\n\n;\n"
      end
    end

    context 'foo' do
      before { get '/javascripts', :assets => [ 'foo' ] }

      its( :status ){ should == 200 }

      # TODO approval
      example 'body' do
        subject.body.should == "// this is foo.js\n;\n/**\n * Welcome to astro.js!\n */\n\n;\n"
      end
    end
  end
end
