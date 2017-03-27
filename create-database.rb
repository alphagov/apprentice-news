#!/usr/bin/env ruby

require 'pg'

db_dir = '.postgres-data'
# Create the database (unless it's already been created)
system("initdb -D #{db_dir}") unless File.directory? db_dir

# Start the database server (unless it's already running)
system("pg_ctl -D #{db_dir} -l logs/postgres.log start") unless system("pg_ctl -D #{db_dir} status")

# (re)create the apprenticenews database
system('dropdb apprenticenews 2> /dev/null')
system('createdb apprenticenews')

conn = PG.connect(dbname: 'apprenticenews')

conn.exec "create table submissions (id bigserial primary key, url text not null, title text not null)"
submissions = [
  {url:'https://www.gov.uk', title: 'Really cool website where you can interact with the UK Government'},
  {url:'https://duckduckgo.com', title: 'The search engine that doesn\'\'t track you'},
  {url:'https://github.com/alphagov/apprentice-news', title: 'The most awesome link aggregation site ever'},
]

submissions.each do |submission|
  conn.exec "insert into submissions (url, title) values ('#{submission[:url]}','#{submission[:title]}')"
end
