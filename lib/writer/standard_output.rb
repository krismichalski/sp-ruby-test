module Writer
  class StandardOutput
    def self.call(storage:)
      new.call(storage: storage)
    end

    def call(storage:)
      storage.each do |visit|
        puts visit
      end
    end
  end
end
