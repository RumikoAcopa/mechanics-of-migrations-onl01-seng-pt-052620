require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'


require 'bundler/setup'
Bundler.require

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS artists (
  id INTEGER PRIMARY KEY,
  name TEXT,
  genre TEXT,
  age INTEGER,
  hometown TEXT
  )
SQL
 
ActiveRecord::Base.connection.execute(sql)
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/artists.sqlite"
)

require_relative "../artist.rb"
