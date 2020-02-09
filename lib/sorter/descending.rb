module Sorter
  class Descending
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.sort_by { |_path, view_count| -view_count }.to_h
    end
  end
end
