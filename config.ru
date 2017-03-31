require_relative 'app/main'
require_relative 'app/database'

database = Database.new

# Configure the main ApprenticeNews class to be constructed with the database instance:
use ApprenticeNews, database

run ApprenticeNews

