class Parser
  def self.sum(arr)
    sum = 0
    for i in arr
      sum += i.to_i
    end
    puts sum
  end

  def self.minus(arr)
    sum = 0
    for i in arr
     sum -= i.to_i
    end
    puts sum
  end

end

class Repl
  def self.exec
    n = 0
    while true
       print "WENT [#{n}] - > "
       cmd = gets.chomp
       if cmd.split(' ').include? "+"
         Parser.sum cmd.split(' ')
       elsif cmd.split(' ').include? "-"
         Parser.minus cmd.split(' ')
       else
         puts ' "#{cmd}" is not a WENT command'
       end
       n += 1
    end
  end
end
