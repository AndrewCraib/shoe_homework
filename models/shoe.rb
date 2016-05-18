require('PG')
require_relative('../DB/sql_runner')

class Shoe

    attr_reader :id, :name, :address, :type, :size


  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @address =options['address']
    @type = options['type']
    @size = options['size'].to_i

  end

 def save()
  sql = "INSERT INTO shoes(
    id,
    name,
    address,
    type,
    size
    )
    VALUES (
      '#{@id}',
      '#{@name}',
      '#{@address}',
      '#{@type}',
      #{@size}
    )"
  return Shoe.map_item(sql)
 end

 def self.all()
   sql = "SELECT * FROM shoes"
   return Shoe.map_items(sql)
 end


   def self.map_items(sql)
     shoes = SqlRunner.run(sql)
     result = shoes.map { |shoe| Shoe.new( shoe ) }
     return result
   end

   def self.map_item(sql)
     shoes = Shoe.map_items(sql)
     return shoes.first
   end
 
end