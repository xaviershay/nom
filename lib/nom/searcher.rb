module Nom
  class Searcher
    BASE = "ausnom.localhost"

    def search(search, index = nil)
      foods = request("/foods.json?q=#{URI.escape(search)}")

      foods = [foods[index.to_i-1]] if index && foods[index.to_i-1]

      case foods.size
        when 0: formatter.print_empty
        when 1: formatter.print_one(get_by_id(foods.first["food_id"]))
        else    formatter.print_list(foods)
      end
    end
    
    def get_by_id(food_id)
      request("/foods/#{food_id}.json")
    end

    def request(url)
      res = Net::HTTP.start(BASE, 80) {|http|
        http.get(url)
      }
      JSON.parse(res.body)
    end

    def formatter
      Nom::Formatter.new
    end
  end
end
