require 'sinatra'
require 'json'
require 'dm-core'
require 'dm-migrations'

require_relative 'counter'
require_relative 'routes'

set :public_folder, 'assets'
