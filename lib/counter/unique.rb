require_relative 'base'

module Counter
  class Unique < Base
    private

    def count(ips_array:)
      ips_array.uniq.size
    end
  end
end
