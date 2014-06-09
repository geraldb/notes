############
# call from app/root folder; use:
#
#    rake seed



BUILD_DIR = "."
  
BEER_DB_PATH = "#{BUILD_DIR}/beer.db"

DB_CONFIG = {
  :adapter   =>  'sqlite3',
  :database  =>  BEER_DB_PATH
}


directory BUILD_DIR

task :env => BUILD_DIR do
  require 'worlddb'
  require 'beerdb'
  require 'logutils/db'
  require 'logger'
  require 'pp'

  LogUtils::Logger.root.level = :debug

  pp DB_CONFIG

  ActiveRecord::Base.establish_connection( DB_CONFIG )
  puts 'Connected - DB Connection established.'

  ### turn on SQL log
  ActiveRecord::Base.logger = Logger.new( STDOUT )
end

desc "Load seeds into #{BEER_DB_PATH}"
task :seed => [:env] do

  [ # 'users',
    'bookmarks',
    'notes' ].each do |seed|
    BeerDb.load( seed, './_seeds' )
  end

  puts 'Done. Bye.'
end
