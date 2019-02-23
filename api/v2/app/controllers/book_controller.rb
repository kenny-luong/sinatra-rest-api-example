require 'sinatra/base'
require 'sinatra/namespace'

class BookController < ApplicationController
  register Sinatra::Namespace

  def initialize(app = nil, processor = $processor.book_processor)
    super(app)
    @processor = processor
  end

  namespace '/api/v2' do
    before do
      content_type 'application/json'
    end

    get '/books' do
      @processor.all.to_json
    end

    get '/books/:id' do |id|
      book = @processor.find(id)
      halt(404, { message:'Book Not Found'}.to_json) unless book
      book.to_json
    end

    post '/books' do
      book_id = @processor.create(json_params)
      if book_id
        response.headers['Location'] = "#{base_url}/api/v1/books/#{book_id}"
        status 201
      else
        status 422
        body(json_params)
      end
    end

    patch '/books/:id' do |id|
      if @processor.update(id, json_params)
        @processor.find(id).to_json
      else
        status 422
      end
    end

    delete '/books/:id' do |id|
      book = @processor.find(id)
      @processor.destroy(id) if book
      status 204
    end
  end
end
