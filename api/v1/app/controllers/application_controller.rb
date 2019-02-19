require 'sinatra/base'
require 'sinatra/namespace'

class ApplicationController < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1' do
    get '/' do
      'Welcome to Booklist!'
    end
  end
end
