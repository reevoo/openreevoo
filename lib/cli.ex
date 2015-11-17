defmodule Openreevoo.Cli do
  @moduledoc """
  The command line interface that users leave their review with
  """
  @library_prompt "Which library would you like to review? (choose a number):"
  @rating_prompt "Out of 10, how would you rate"
  @good_points_prompt "What was good about"
  @bad_points_prompt "What was bad about"

  alias Openreevoo.Review

  def run do
    choose_library |> get_review |> format_review |> IO.puts
  end

  defp choose_library do
    IO.puts Openreevoo.Dependencies.formatted
    library_index_str = prompt(@library_prompt, "")
    {library_index, _} = library_index_str |> Integer.parse
    Enum.at(Openreevoo.Dependencies.list, library_index)
  end

  defp get_review(library) do
    %Review{
      rating: prompt(@rating_prompt, library),
      good_points: prompt(@good_points_prompt, library),
      bad_points: prompt(@bad_points_prompt, library)
    }
  end

  defp format_review(review) do
    "Rating: #{review.rating} Good points: #{review.good_points} Bad points: #{review.bad_points}"
  end

  defp prompt(question, library) do
    IO.gets "#{question} #{library}?\n> "
  end
end
