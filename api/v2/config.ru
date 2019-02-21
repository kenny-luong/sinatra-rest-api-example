require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra'
require 'sequel'
require 'dotenv'

Dir.glob('./app/{controllers,models,processors,storage}/*.rb').each { |file| require file }

configure do
  $processor = ProcessorFactory.new("test_config")
end

run ApplicationController
use BookController
