require 'sqlite3' #get gems which is SQLite3 gem
require 'singleton' #makes sure we only have one instance of our DB

class PlayDBConnection < SQLite3::Database #Pulls database into ruby file and makes sure we only have one instance of the DB
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true #makes the data we pull come back as a hash
  end
end

class Play #Meat of the ORM
  attr_accessor :id, :title, :year, :playwright_id

  def self.all #shows every entry in our plays DB
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  #Creates new instance of Play class
  def initialize(options) 
    @id = options['id'] #flexible whether this is defined
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create #This inserts a new row of data for our table
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id) 
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id #the last_insert_row_id auto fills an id for the row we're inserting
  end

  def update
    raise "#{self} not in database" unless self.id #opposite of create, we can only update if the data is already in the database
    #<<-SQL ... query ... SQL is a heredoc. This lets us write a long multi-line query
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        -- title ? is tied to self.title, year ? tied to self.year, etc...
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ? --Ties to self.id
    SQL
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT *
      FROM plays
      WHERE title = ?
    SQL
  end

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM plays
      LEFT JOIN playwrights ON (plays.playwright_id = playwrights.id)
      WHERE name = ?
    SQL
  end
end

class Playwright

  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def self.find_by_name(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year) 
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id #the last_insert_row_id auto fills an id for the row we're inserting
  end

  def update
    raise "#{self} not in database" unless self.id

    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE playwrights
      SET name = ?, birth_year = ?
      WHERE id = ?
    SQL
  end

  def get_plays
    
    PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM plays
      WHERE playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end

end