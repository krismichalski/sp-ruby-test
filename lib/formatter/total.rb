require_relative 'base'

module Formatter
  class Total < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} visits"
    end
  end
end
