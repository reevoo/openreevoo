defmodule Openreevoo.Cli do
  @moduledoc """
  The command line interface that users leave their review with
  """

  alias Openreevoo.Review

  def run do
    choose_library |> write_review |> format_review
  end

  defp choose_library do
    library_index_str = prompt(
      "\n#{Openreevoo.Dependencies.formatted}\nWhich library would you like to review? (choose a number)"
    )
    {library_index, _} = library_index_str |> Integer.parse
    Enum.at(Openreevoo.Dependencies.list, library_index)
  end

  defp write_review(library) do
    %Review{
      rating: prompt("Out of 10, how would you rate #{library}?"),
      good_points: prompt("What was good about #{library}?"),
      bad_points: prompt("What was bad about #{library}?")
    }
  end

  defp format_review(review) do
    "\nRating: #{review.rating}\nGood points: #{review.good_points}\nBad points: #{review.bad_points}"
  end

  defp prompt(text) do
    String.rstrip(IO.gets "#{text}\n> ")
  end
end
