#setting for activerecord
require 'active_record'

options = {
	adapter: 'postgresql',
	database: 'artist_app_database_official'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)