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

  defp get_applications(:prod) do
    [applications: [:logger]]
  end
  defp get_applications(_) do
    [applications: [:logger]]
  end

  def application do
    get_applications Mix.env
  end

  defp deps do
    []
  end
end
