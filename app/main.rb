require 'sinatra'

get '/' do
  erb :index, locals: { title: 'Apprentice News' }
end
