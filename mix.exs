defmodule PlugEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_ex,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger,:plug_cowboy],
      mod: {PlugEx, []},
      env: [cowboy_port: 8000]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     # {:plug, "~> 1.7"},
     # {:cowboy, "~> 2.6"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
