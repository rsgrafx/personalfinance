defmodule Mix.Tasks.StartApp do 

  @moduledoc """
    CLI starting point for application
  """
  use Mix.Task 

  @shortdoc """
    Start Main Application
  """
  def run(args) do 
    {_opts, args, _} = OptionParser.parse(args)
    # OptionParser - read docs
    string = Enum.join(args, " ")
    Mix.shell.info(string)
  end

end