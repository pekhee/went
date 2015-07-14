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

      output.puts Parser.new(cmd).response
    end

    def run
      catch :exit do
        loop { run_line }
      end

      output.puts "Exiting"
    end

    private
    def line_number
      cache = @line_number
      @line_number += 1

      cache
    end
  end
end
