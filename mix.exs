defmodule PersonalBanking.Mixfile do
  use Mix.Project

  def project do
    [app: :banking,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger,:postgrex, :ecto]]
  end

  defp deps do
    [
     {:timex, "~> 0.13.4" },
     {:exredis, github: "artemeff/exredis", tag: "0.1.0"},
     {:postgrex, "~> 0.7.0"},
     {:ecto, "0.7.1"},
     {:poison, github: "devinus/poison"}
   ]
  end
end
