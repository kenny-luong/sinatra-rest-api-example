require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra'
require 'sequel'
require 'dotenv'

Dir.glob('./app/{controllers,models}/*.rb').each { |file| require file }

Dotenv.load('config.env')

configure do
  $db = Sequel.connect(
      :adapter  => ENV['ADAPTER'],
      :user     => ENV['DATABASE_USER'],
      :host     => ENV['DATABASE_URL'],
      :database => ENV['DATABASE_NAME'],
      :password => ENV['DATABASE_PASSWORD']
    )
end

run ApplicationController
use BookController
