require_relative 'base'

module Counter
  class Total < Base
    def count
      @ips_array.size
    end
  end
end
