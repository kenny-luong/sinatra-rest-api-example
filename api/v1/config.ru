require 'sinatra/base'
require 'mongoid'
require 'sinatra/namespace'
require 'sinatra'

Mongoid.load! 'mongoid.config'

Dir.glob('./app/{controllers,models}/*.rb').each { |file| require file }

run ApplicationController
use BookController
