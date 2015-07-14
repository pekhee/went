require "stringio"
require "went"

RSpec.describe Went::Repl do
  it "substracts two values" do
    substraction_sample = StringIO.new "- 1 1\n"
    output = instance_double("IO", "output")

    allow(output).to receive(:puts).with 0
    allow(output).to receive(:print)

    Went::Repl.new(substraction_sample, output).run_line
  end
end
