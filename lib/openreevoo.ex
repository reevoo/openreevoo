
defmodule Openreevoo do
  @moduledoc """
  Elixir client for writing reviews of elixir libraries.
  """

  def main(args) do
    args |> directory |> File.cd!(&Openreevoo.Cli.run/0)
  end

  def directory([]) do
    "."
  end

  def directory(args) do
    hd(args)
  end
end
