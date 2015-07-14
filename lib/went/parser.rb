module Went
  class Parser
    def self.sum(arr)
      arr = prepare(arr)
      arr.reduce {|sum, e| sum + e}
    end

    def self.minus(arr)
      arr = prepare(arr)
      arr.reduce {|sum, e| sum - e}
    end

    def self.prepare(arr)
      arr.shift
      arr.map {|e| e.to_i}
    end
  end
end
