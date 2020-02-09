require_relative "base"

module Formatter
  class Unique < Base
    def format
      "#{@path} #{@number_of_visits} unique views"
    end
  end
end
