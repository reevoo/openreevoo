defmodule Openreevoo.Cli do
  @moduledoc """
  The command line interface that users leave their review with
  """

  alias Openreevoo.Review

  def run do
    choose_library |> get_review |> format_review |> IO.puts
  end

  defp choose_library do
    IO.puts Openreevoo.Dependencies.formatted
    library_index_str = IO.gets "Which library would you like to review? (choose a number): "
    {library_index, _} = library_index_str |> Integer.parse
    Enum.at(Openreevoo.Dependencies.list, library_index)
  end

  defp get_review(library) do
    %Review{
      rating: rating(library),
      good_points: good_points(library),
      bad_points: bad_points(library)
    }
  end

  defp format_review(review) do
    "Rating: #{review.rating} Good points: #{review.good_points} Bad points: #{review.bad_points}"
  end

  defp rating(library) do
    IO.gets "Out of 10, how would you rate #{library}?\n> "
  end

  defp good_points(library) do
    IO.gets "What was good about #{library}?\n> "
  end

  defp bad_points(library) do
    IO.gets "What was bad about #{library}?\n> "
  end
end
