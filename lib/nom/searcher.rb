module Nom
  class Searcher
    BASE = "ausnom.localhost"

    def search(*args)
      index = Integer(args.last) rescue nil
      args.pop if index

      foods = request("/foods.json?q=#{URI.escape(args.join(' '))}")

      foods = [foods[index.to_i-1]] if index && foods[index.to_i-1]

      case foods.size
        when 0 then formatter.print_empty
        when 1 then formatter.print_one(get_by_id(foods.first["food_id"]))
        else        formatter.print_list(foods)
      end
    end
    
    def get_by_id(food_id)
      request("/foods/#{food_id}.json")
    end

    def request(url)
      res = Net::HTTP.start(config[:base], 80) {|http|
        http.get(url)
      }
      JSON.parse(res.body)
    end

    def formatter
      Nom::Formatter.new
    end

    def config
      @config ||= Nom::Config.new
    end
  end
end
