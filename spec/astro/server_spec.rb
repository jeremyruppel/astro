require 'spec_helper'

describe Astro::Server do

  def app
    described_class
  end

  it 'gets /' do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'foo!'
  end
end
