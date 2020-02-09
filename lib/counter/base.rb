module Counter
  class Base
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.map do |path, ips_array|
        [path, count(ips_array: ips_array)]
      end.to_h
    end

    private

    def count(ips_array:)
      raise NotImplementedError
    end
  end
end
