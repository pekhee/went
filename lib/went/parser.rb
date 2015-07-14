module Went
  class Parser
    attr_accessor :instruction, :command, :parsed_response

    def initialize(command)
      self.command = command.split(" ")

      parse
    end

    def response
      parsed_response
    end

    private
    def parse
      prepare

      self.parsed_response = case instruction
      when "+"
        sum
      when "-"
        subtract
      when "*"
        multiply
      when "/"
        divide
      when "exit"
        throw :exit
      else
        raise "IllegalInstruction"
      end
    end

    def sum
      command.reduce {|sum, e| sum + e}
    end

    def subtract
      command.reduce {|sum, e| sum - e}
    end

    def multiply
      command.reduce {|sum, e| sum * e}
    end

    def divide
      command.reduce {|sum, e| sum / e}
    end

    def prepare
      self.instruction = command.shift
      self.command = command.map {|e| e.to_i}
    end
  end
end
