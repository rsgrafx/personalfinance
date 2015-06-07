defmodule Uptime do 

  def read_in(file) do
    File.read(file)
  end

  def return_read(file) do
    {:ok, data} = File.read(file)
    data
  end

  def file_path(_path) do
    Path.absname(_path)
  end

  def filter(input, regx_match) do

    String.split(input, "\n")
      |> Enum.filter( fn(line) -> Regex.match?(regx_match, line) end)
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

  def process_pipe(regx_match, path_string) do
    file_path(path_string) |> return_read |> filter(regx_match)
  end

  def process_id(lines) do
     IO.puts(lines)
     Enum.map(lines, fn(line) ->
        stripped = String.strip( line )
        columns = Regex.split(~r/ /, stripped, trim: true)
        Enum.at( columns, 0 ) 
     end)
  end

end