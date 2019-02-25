require 'sinatra/base'
require 'sinatra/namespace'

class ApplicationController < Sinatra::Base
  register Sinatra::Namespace

  def initialize(app = nil, processor)
    super(app)
    @processor = processor
  end

  helpers do
  end

  namespace '/api/v2' do
    get '/' do
      'Welcome to Booklist!'
    end

    get '/ping' do
      status 200
    end

    get '/healthcheck' do
      content_type :json
      @processor.healthcheck.to_json
    end
  end

  private

  attr_writer :processor
end
