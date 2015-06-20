defmodule StartAppTest do 
  use ExUnit.Case

  @moduledoc """
    The goal of this task is to start the application from one command.
    # Ensure that a connection to redis is secured.
  """

  test "start app" do 
    Mix.Tasks.StartApp.run(["start"])
    assert_received { :mix_shell, :info, ["start"] }
  end

end

# http://www.jarredtrost.com/category/cowboy/