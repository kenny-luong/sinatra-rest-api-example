require 'sinatra/base'
require 'mongoid'
require 'sinatra/namespace'
require 'sinatra'

Mongoid.load! 'mongoid.config'

Dir.glob('./api/v1/app/{controllers,models}/*.rb').each { |file| require file }

run ApplicationController
use BookController
