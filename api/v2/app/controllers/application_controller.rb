require 'sinatra/base'
require 'sinatra/namespace'

class ApplicationController < Sinatra::Base
  register Sinatra::Namespace

  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://{request.env['HTTP_HOST']}"
    end

    def json_params
      begin
        JSON.parse(request.body.read)
      rescue
        halt 400, { message:'Invalid JSON' }.to_json
      end
    end
  end

  namespace '/api/v1' do
    get '/' do
      'Welcome to Booklist!'
    end

    get '/ping' do
    end

    get '/healthcheck' do
    end
  end
end
