require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra'
require 'sequel'
require 'dotenv'
require 'yaml'

Dir.glob('./app/{controllers,helpers,models,processors,storage}/*.rb').each { |file| require file }


config_filepath = ENV["CONFIG_PATH"] || './config/api-v2.yml'

config = YAML.load_file(config_filepath)
processor_factory = ProcessorFactory.new(config)

run ApplicationController
use ApplicationController, processor_factory.application_processor
use BookController, processor_factory.book_processor
