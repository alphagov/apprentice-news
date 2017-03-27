require 'sinatra/base'

class ApprenticeNews < Sinatra::Application

  get '/' do
    erb :index, locals: { title: 'Apprentice News' }
  end

  run! if app_file == $0
end
