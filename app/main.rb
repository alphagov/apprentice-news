require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

data = Database.new

  get '/' do
    submissions = data.retrieval
    erb :index, locals: { title: 'Apprentice News', submissions: submissions }
  end


  #def initialize
  #  data = Database.new

    if app_file == $0
      data.init
      run!
    end
  #end

  #conn = connection





end


#above stuff after submissions will eventually be replaced by the result of a function(s) in database.rb,
#that function to retrieve data from database, use SQL statement similar(the same) to that in the command line.
