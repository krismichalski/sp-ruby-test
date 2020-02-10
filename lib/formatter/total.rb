# frozen_string_literal: true

module Formatter
  class Total < Base
    private

    def format(path:, view_count:)
      "#{path} #{view_count} visits"
    end
  end
end
