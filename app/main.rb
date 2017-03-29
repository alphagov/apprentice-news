require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

  configure :development do
    set :database_config, { dbname: 'apprenticenews' }
  end

  configure :production do
    set :database_config, production_database_config
  end

  def db_connection
    begin
      connection = PG.connect(settings.database_config)
      yield(connection)
    ensure
      connection.close
    end
  end

  def everything
    db_connection do |conn|
      conn.exec('SELECT * FROM submissions')
    end
  end

  get '/' do
    @everything = everything
    erb :index, locals: { title: 'Apprentice News' }
  end

  get '/submit' do
    erb :submit, locals: {  title: 'Submit'
                            }
  end


  if app_file == $0
    Database.init
    run!
  end


end
