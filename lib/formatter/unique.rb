require_relative 'base'

module Formatter
  class Unique < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} unique views"
    end
  end
end
