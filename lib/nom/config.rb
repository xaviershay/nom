require 'delegate'
require 'yaml'

module Nom
  class Config < SimpleDelegator
    FILE_NAME = ".nom"

    def initialize
      super([
        File.join(File.dirname(__FILE__), "..", FILE_NAME), 
        File.join("~", FILE_NAME)
      ].inject({}) do |a, file_name|
        a.merge(lambda {|f|  
          File.exists?(f) ? symbolize_keys(YAML::load(IO.read(f))) : {}
        }[File.expand_path(file_name)])
      end)
    end

    def [](*path)
      path.inject(__getobj__()) {|config, item|
        config[item]
      }
    end

    private

    def symbolize_keys(hash)
      hash.inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value.is_a?(Hash) ? symbolize_keys(value) : value
        options
      end
    end
  end
end
