require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application




  get '/' do
    erb :index, locals: { title: 'Apprentice News', submissions: [{url: @store} ] }
  end

  if app_file == $0
    Database.new.init
    run!
  end

  #conn = connection

  def data(retrieve)
    return retrieve
  end



end


#above stuff after submissions will eventually be replaced by the result of a function(s) in database.rb,
#that function to retrieve data from database, use SQL statement similar(the same) to that in the command line.
