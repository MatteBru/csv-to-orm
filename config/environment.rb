require 'bundler/setup'
require 'rake'
require 'active_record'
require 'pry'
Bundler.require


require_relative '../lib/models/accident.rb'

# DB = 
ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "db/accidents.db"
    )

# DB = ActiveRecord::Base.connection
