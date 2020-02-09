require_relative 'base'

module Counter
  class Total < Base
    private

    def count(ips_array:)
      ips_array.size
    end
  end
end
