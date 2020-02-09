module Counter
  class Base
    def initialize(ips_array:)
      @ips_array = ips_array
    end

    def count
      raise NotImplementedError
    end
  end
end
