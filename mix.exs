defmodule SimpleRegistry.Mixfile do
  use Mix.Project

  def project do
    [app: :simple_registry_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  defp get_application(:prod) do
    [applications: [:logger]]
  end
  defp get_application(_) do
    [applications: [:logger]]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
