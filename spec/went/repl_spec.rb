require "stringio"
require "went"

RSpec.describe Went::Repl do
  def prepare_repl(command)
    sample = StringIO.new command
    output = instance_double("IO", "output for #{command}")

    allow(output).to receive(:print)

    repl = Went::Repl.new(sample, output)

    [output, repl]
  end

  def assert_command_result(command, result)
    output, repl = prepare_repl(command)

    allow(output).to receive(:puts).with result

    repl.run_line
  end

  it "substracts two values" do
    assert_command_result("- 1 1\n", 0)
  end

  it "adds two values" do
    assert_command_result("+ 1 1\n", 2)
  end

  it "multiplies two values" do
    assert_command_result("* 2 4\n", 8)
  end

  it "divides two values" do
    assert_command_result("/ 4 2\n", 2)
  end

  it "handles exit" do
    assert_command_result("exit\n", "Exiting")
  end
end
