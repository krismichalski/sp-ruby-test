require_relative 'base'

module Counter
  class Unique < Base
    def count
      @ips_array.uniq.size
    end
  end
end
