# frozen_string_literal: true

module Formatter
  class Unique < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} unique views"
    end
  end
end
