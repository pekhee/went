module Went
  class Repl
    attr_accessor :input, :output

    def initialize(input, output)
      self.input = input
      self.output = output
      @line_number = 0
    end

    def run_line
      output.print "WENT [#{line_number}] - > "
      cmd = input.gets.chomp
      if cmd.split(' ').include? "+"
        output.puts Parser.sum cmd.split(' ')
      elsif cmd.split(' ').include? "-"
        output.puts Parser.minus cmd.split(' ')
      else
        output.puts ' "#{cmd}" is not a WENT command'
      end
    end

    def run
      loop { run_line }
    end

    private
    def line_number
      cache = @line_number
      @line_number += 1

      cache
    end
  end
end
