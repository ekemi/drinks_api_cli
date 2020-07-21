class Cli

    def run
        puts"---------------------------------------------------------------------"
        print "       W".red
        print"E".blue
        print"L".yellow
        print"C".green
        print"O".red
        print"M".blue
        print"E".red
        print"        T".yellow
        print"O       ".blue
        print"D".red
        print"R".blue
        print"I".yellow
        print"N".red
        print"K".blue
        print"        A".yellow
        print"P".red
        print"P".blue
        puts""
        puts"---------------------------------------------------------------------"
        puts""
        ## next step presented to the user
       start_with_ingredient
        sleep 1
        user_choice
        input = gets.strip.downcase

        while input !="exit"
           if input == "list"
               ###print the same list
               print_drinks(Drink.find_by_ingredient(@input_ingredient))
           elsif input.to_i > 0  && input.to_i <= Drink.find_by_ingredient(@input_ingredient).length
               drink = Drink.find_by_ingredient(@input_ingredient)[input.to_i-1]
               Api.get_drink_details(drink) if !drink.instructions
               print_drink_details(drink)

           #elsif input =="ingredient"
               #start_with_ingredient
           else
               puts" "
               error
            end
            puts" "
            user_choice
            input =gets.strip.downcase
        end
        puts""
        goodbye
    end   
    def error
        puts""
        puts"Your entered a wrong information, try again!".red
    end

    def   start_with_ingredient
        puts"  "
        puts"Enter an ingredient to see all the drinks made with that ingredient.".yellow
        puts" "
        @input_ingredient = gets.strip.downcase
        Api.get_drinks(@input_ingredient)
        #binding.pry
        print_drinks(Drink.all)
    end

    def print_drinks(data)

        puts" "
        puts"The list of drinks made with #{@input_ingredient}".light_blue
        puts" "
         data.each.with_index(1) do |key, value| #Iterate to get all the drinks.
            puts "#{value}. #{key.drink_name}"                
        end
        def user_choice
            puts" "
            puts"Type a number to see the instruction for a drink.".green
            puts"Type 'list' to see the list of drinks again.".blue
            puts"Type 'ingredient' to select a new ingredient.".yellow
            puts"Type 'exit' to exit the program.".red
         end
         def goodbye
            puts" Have a wonderful day!"
         end
     end

  

end