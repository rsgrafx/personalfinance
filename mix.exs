defmodule PersonalBanking.Mixfile do
  use Mix.Project

  def project do
    [app: :banking,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger,:mariaex, :ecto]]
  end

  defp deps do
    [
     { :timex, "~> 0.13.4" },
     { :mariaex, ">= 0.1.0" },
     { :ecto, github: "elixir-lang/ecto"}
   ]
  end
end
