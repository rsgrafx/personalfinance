defmodule Uptime do 

  def read_in(file) do
    File.read(file)
  end

  def file_path(_path) do
    Path.absname(_path)
  end

  def filter(input, regx_match) do
    data = String.split(input, "\n")
    Enum.filter(data, fn(line) -> Regex.match?(regx_match, line) end)
  end

end