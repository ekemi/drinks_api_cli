class Drink
attr_accessor :drink_name, :drink_id, :link_picture,:ingredient, :instructions ,:category,:changed_date, :glass,:measure

@@all =[]

def initialize(drink_name:,link_picture: ,drink_id:, ingredient:)
    @drink_name = drink_name

end
end