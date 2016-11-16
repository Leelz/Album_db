require('pg')
require_relative('../db/sql_runner')

class Collector
  attr_accessor  :name
  attr_reader :id

  def initialize( options )
    @name = options[ 'name' ]
    @id = options[ 'id' ]
  end

  def save
    sql =
    "INSERT INTO collectors
    (name)
    VALUES
    ('#{@name}');
    "
    result = SqlRunner.run( sql )
    @id = result[0]['id'].to_i
  end

end