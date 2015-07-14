module Went
  class Parser
    def self.sum(arr)
      sum = 0
      for i in arr
        sum += i.to_i
      end

      sum
    end

    def self.minus(arr)
      arr.shift
      sum = arr.shift.to_i
      for i in arr
       sum -= i.to_i
      end

      sum
    end
  end
end
