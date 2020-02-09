require_relative "base"

module Formatter
  class Total < Base
    def format
      "#{@path} #{@number_of_visits} visits"
    end
  end
end
