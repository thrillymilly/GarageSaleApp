require 'pry'
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'petfinder'
}

ActiveRecord::Base.establish_connection(options)
