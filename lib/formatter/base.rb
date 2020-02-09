module Formatter
  class Base
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.map do |path, view_count|
        format(path: path, view_count: view_count)
      end
    end

    private

    def format(path:, view_count:)
      raise NotImplementedError
    end
  end
end
