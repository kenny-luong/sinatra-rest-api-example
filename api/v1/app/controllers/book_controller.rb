require 'sinatra/base'
require 'sinatra/namespace'

class BookController < Sinatra::Base
  register Sinatra::Namespace

  namespace '/api/v1' do
    before do
      content_type 'application/json'
    end

    get '/books' do
      books = Book.all

      [:title, :isbn, :author].each do |filter|
        books = books.send(filter, params[filter]) if params[filter]
      end

      books.to_json
    end
  end
end
