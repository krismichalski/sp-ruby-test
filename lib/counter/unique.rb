module Counter
  class Unique
    def initialize(ips_array:)
      @ips_array = ips_array
    end

    def count
      @ips_array.uniq.size
    end
  end
end
