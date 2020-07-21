class Drink
        attr_accessor :drink_name, :drink_id, :link_picture,:ingredient, :instructions ,:category,:changed_date, :glass,:measure

        @@all =[]

    def initialize(drink_name:,link_picture: ,drink_id:, ingredient:)
        @drink_name = drink_name
        @drink_id = drink_id
        @ingredient = ingredient
        @link_picture = link_picture
        @@all << self

    end

    def self.all

        @@all
 
    end

    def self.find_by_ingredient(ingredient)
        @@all.select {|value| value.ingredient == ingredient}

    end

end