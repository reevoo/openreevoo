defmodule Openreevoo do
  @moduledoc """
  Elixir client for writing reviews of elixir libraries.
  """

  def main(args) do
    args |> directory |> in_directory(&deps/0)
  end

  def directory([]) do
    "."
  end

  def directory(args) do
    hd(args)
  end

  def in_directory(dir, fun) do
    File.cd! dir, fun
  end

  def deps do
    Mix.Dep.Lock.read
    |> Enum.map(fn {k,_} -> to_string(k) <> "\n" end)
    |> Enum.join
    |> IO.puts
  end
end
