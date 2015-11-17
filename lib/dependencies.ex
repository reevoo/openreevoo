defmodule Openreevoo.Dependencies do
  @moduledoc """
  Finds dependencies in the current project
  """

  def formatted do
    list |> format
  end

  def list do
    Mix.Dep.Lock.read
    |> Enum.map(fn {k,_} -> to_string(k) end)
  end

  defp format(deps) do
    deps
    |> Enum.with_index
    |> Enum.map(fn {library, index} -> "#{to_string(index)}: #{library}\n" end)
    |> Enum.join
  end
end
