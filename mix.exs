defmodule Propcheck.Mixfile do
  use Mix.Project

  def project do
    [app: :propcheck,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger],
     mod: {PropCheck.App, []}]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]


  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:dialyze, "0.2.0", only: [:dev, :test]},
      {:ex_doc, "~>0.8", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      # {:proper, git: "../../erlang/proper/proper"}
      {:proper, github: "manopapad/proper", ref: "fa58f8" } # from 26.05.2015
      # {:proper, "~> 1.1.0"}
    ]
  end
end
