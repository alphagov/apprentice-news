require 'pg'
require 'etc'

class Database

  attr_reader :store
  def initialize
    uri = URI.parse ENV.fetch('DATABASE_URL', "postgres://#{Etc.getlogin}@localhost/apprenticenews")
    @conn = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
  end
  def init
    unless submissions_table_created(@conn)
      puts 'No submissions found, creating some example ones'

      @conn.exec "create table submissions (id bigserial primary key, url text not null, title text not null)"
      submissions = [
        {url:'https://www.gov.uk', title: 'Really cool website where you can interact with the UK Government'},
        {url:'https://duckduckgo.com', title: 'The search engine that doesn\'\'t track you'},
        {url:'https://github.com/alphagov/apprentice-news', title: 'The most awesome link aggregation site ever'},
      ]

      submissions.each do |submission|
        @conn.exec "insert into submissions (url, title) values ('#{submission[:url]}','#{submission[:title]}')"
      end
    end
  end

  def submissions_table_created(conn)
    conn.exec "select exists (select 1 from information_schema.tables where table_name = 'submissions')" do |result|
      return result.any? { |row| row['exists'] == 't' }
    end
  end
  def retrieval
    return @conn.exec "select * from submissions"
  end




end
