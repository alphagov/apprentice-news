require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

  def initialize(app = nil, database = Database.new)
    super app
    @db = database
    @db.init
  end

  get '/' do
    submissions = @db.get_submissions
    erb :index, locals: { submissions: submissions }
  end

end

