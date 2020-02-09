module Counter
  class Total
    def initialize(ips_array:)
      @ips_array = ips_array
    end

    def count
      @ips_array.size
    end
  end
end
