require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

  db = Database.new
  db.init

  get '/' do
    submissions = db.get_submissions
    erb :index, locals: { submissions: submissions }
  end

  run! if app_file == $0

end

