defmodule InquisitorJsonapi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :inquisitor_jsonapi,
      version: "0.2.0",
      elixir: "~> 1.11",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      description: description(),
      package: package(),
      deps: deps(),
      aliases: aliases(),
      docs: [
        extras: ["pages/Default\ Query\ Scopes.md"]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description(), do: "JSON API Handlers for Inquisitor"

  defp package() do
    [
      maintainers: ["Brian Cardarella"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/DockYard/inquisitor_jsonapi"}
    ]
  end

  defp elixirc_paths(:test), do: elixirc_paths(:dev) |> Enum.concat(["test/support"])
  defp elixirc_paths(_), do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:inquisitor, "~> 0.5"},
      {:ecto, "> 2.0.0"},
      {:ecto_sql, "~> 3.0"},
      {:plug, "~> 1.3", only: [:test, :dev]},
      {:earmark, "~> 1.0", only: :dev},
      {:postgrex, "> 0.0.0", only: [:test, :dev]},
      {:ex_check, "~> 0.14.0", only: [:dev], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev], runtime: false},
      {:doctor, ">= 0.0.0", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
    ]
  end

  defp aliases do
    [
      "ecto.init": ["ecto.drop", "ecto.create", "ecto.migrate"]
    ]
  end
end
