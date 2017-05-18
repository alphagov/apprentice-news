require 'sinatra/base'
require_relative './database'

class ApprenticeNews < Sinatra::Application

data = Database.new

  get '/' do
    submissions = data.retrieval
    puts 'inside root controller'
    if params.key?("submitted")
      erb :index, locals: { title: 'Apprentice News', submissions: submissions, submitted: true }
    else
      erb :index, locals: { title: 'Apprentice News', submissions: submissions }
    end
  end

  get '/submit' do
    erb :submit, locals: {title: 'Submit'}
  end



  #def initialize
  #  data = Database.new


  post '/submit' do
   link = params[:link]
   description = params[:description]
   data.submit(link, description)
  # @submitted = true
   #erb :submitted, :locals => {title: 'Submitted', 'link' => link, 'description' => description}
   redirect to('/?submitted=true')
 end

    if app_file == $0
      data.init
      run!
    end
  #end

  #conn = connection









end


#above stuff after submissions will eventually be replaced by the result of a function(s) in database.rb,
#that function to retrieve data from database, use SQL statement similar(the same) to that in the command line.
