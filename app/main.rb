require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

  get '/' do
    erb :index, locals: { title: 'Apprentice News' }
  end

  if app_file == $0
    Database.init
    run!
  end
end
