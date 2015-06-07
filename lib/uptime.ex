defmodule Uptime do 

  def read_in(file) do
    File.read(file)
  end

  def file_path(_path) do
    Path.absname(_path)
  end

  def filter(input, regx_match) do
    IO.puts input
    data = String.split(input, "\n")
    Enum.filter(data, fn(line) -> Regex.match?(regx_match, line) end)
  end

  @doc """
  Entry point to module
  """
  def process(regx_match, path_string) do
    IO.puts(path_string)
    path = file_path( path_string )
    {:ok, input } = read_in( path )
    filter( input, regx_match )
  end

end