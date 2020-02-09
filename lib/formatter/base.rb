module Formatter
  class Base
    def initialize(path:, number_of_visits:)
      @path = path
      @number_of_visits = number_of_visits
    end

    def format
      raise NotImplementedError
    end
  end
end
