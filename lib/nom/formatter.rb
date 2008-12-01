module Nom
  class Formatter
    def print_empty
      puts "No foods found :("
    end

    def print_list(foods)
      foods.each_with_index do |food, index|
        puts "%i: %s" % [index + 1, food["name"]]
      end
    end

    def print_one(food)
      puts food["name"]
      config[:nutrients].each do |nutrient|
        if n = food["nutrients"].detect {|x| x["description"].downcase == nutrient.downcase }
          puts "%-10s %s%s" % [n["description"], n["value"], n["scale"]]
        end
      end
    end

    private

    def config
      @config ||= Nom::Config.new
    end
  end
end
