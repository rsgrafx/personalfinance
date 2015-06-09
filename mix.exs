defmodule Banking.Mixfile do
  use Mix.Project

  def project do
    [app: :banking,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:timex, "~> 0.13.4"}]
  end
end
