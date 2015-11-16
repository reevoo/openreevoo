defmodule Openreevoo do
  @moduledoc """
  Elixir client for writing reviews of elixir libraries.
  """

  def main(args) do
    args |> directory |> File.cd!(&deps/0)
  end

  def directory([]) do
    "."
  end

  def directory(args) do
    hd(args)
  end

  def deps do
    Mix.Dep.Lock.read
    |> Enum.map(fn {k,_} -> to_string(k) <> "\n" end)
    |> Enum.join
    |> IO.puts
  end
end
