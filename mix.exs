defmodule PersonalBanking.Mixfile do
  use Mix.Project

  def project do
    [
     app: :personal_banking,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps
    ]
  end

  def application do
    [applications: [:logger,
                    :postgrex, 
                    :ecto,
                    :plug,
                    :cowboy ], mod: {PersonalBanking, []} ]
  end

  defp deps do
    [
     {:timex, "~> 0.13.4" },
     {:exredis, github: "artemeff/exredis"},
     {:postgrex, "~> 0.7.0"},
     {:ecto, "0.7.1"},
     {:poison, github: "devinus/poison"},
     {:plug, github: "elixir-lang/plug"},
     {:cowboy, "~> 1.0.0"}
   ]
  end
end
