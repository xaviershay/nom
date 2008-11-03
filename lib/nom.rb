require 'rubygems'
require 'net/http'
require 'json'

class Nom
  VERSION = "0.0.1"
  BASE = "ausnom.localhost"

  class << self
    def search(search, index = nil)
      res = Net::HTTP.start(BASE, 80) {|http|
        http.get("/foods.json?q=#{URI.escape(search)}")
      }
      foods = JSON.parse(res.body)
      if foods.size > 1
        if index && foods[index.to_i-1]
          print_one(find(foods[index.to_i-1]["food_id"]))
        else
          print_list(foods)
        end
      else
        print_one(find(foods.first["food_id"]))
      end
    end
    
    def find(food_id)
      res = Net::HTTP.start(BASE, 80) {|http|
        http.get("/foods/#{food_id}.json")
      }
      JSON.parse(res.body)
    end

    def print_list(foods)
      foods.each_with_index do |food, index|
        puts "%i: %s" % [index + 1, food["name"]]
      end
    end

    def print_one(food)
      puts food["name"]
      ["Energy", "Protein"].each do |nutrient|
        n = food["all_nutrients"].detect {|x| x["description"].downcase == nutrient.downcase }
        puts "%-10s %s%s" % [n["description"], n["value"], n["scale"]]
      end
    end
  end
end
