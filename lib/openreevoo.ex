defmodule Openreevoo do
  @moduledoc """
  Elixir client for writing reviews of elixir libraries.
  """

  def main(args) do
    args |> directory |> deps |> IO.puts
  end

  def directory([]) do
    "."
  end

  def directory(options) do
    hd(options)
  end

  def deps(directory) do
    case File.read(directory <> "/mix.exs") do
      {:ok, file} -> file
      {:error, error} -> error
    end
  end
end
