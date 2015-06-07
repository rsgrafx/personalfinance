defmodule UptimeTest do
  use ExUnit.Case

  @doc """
  Tests check uptime of Redis / restarts if needed.
  """
  test "reads in file * fixture" do 
    input_file = Path.absname("test/fixture/ps_output.txt")
    {:ok, data } = File.read(input_file)
    assert Uptime.read_in(input_file) == {:ok, data}
  end

  test "returns abs path" do
    input_file = Path.absname("test/fixture/ps_output.txt")
    assert Uptime.file_path("test/fixture/ps_output.txt") == input_file
  end

  test "ps_ax outputs processes" do
    input_file = Path.absname("test/fixture/ps_output.txt")
    {:ok, data } = File.read(input_file)
  end

  test "grep (lines, redis-server) returns lines and processes" do
    lines = """
    foo bar
    bar baz
    redis 1000
    redis-server 999
    mysqld 3930
    """
    output = ["redis 1000", "redis-server 999"]
    assert Uptime.filter(lines, ~r/redis/ ) == output
  end

  test "awk(input, 1) splits on whitespace" do
  end

  test "command works" do 
  end
end